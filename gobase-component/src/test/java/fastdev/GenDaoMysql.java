package fastdev;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.apache.commons.lang.StringUtils;



/**
* 自动生成Bean DAO java文件
* 适合maven目录结构
* @author dongyu.cai
*
*/
public class GenDaoMysql {
     public static void main(String[] args) {
         
          String packageOutPath = "com.renren.fenqi.component.dao.risk";
          String authorName = "zicui.liu";
          String tablename = "goods";
         
          new GenDaoMysql(packageOutPath,authorName,tablename,"DAO").toJavaDAO();
         
     }
    
     private String packageOutPath = "";//指定实体生成所在包的路径
     private String authorName = "";//作者名字
     private String tablename = "";//表名
     
     private String[] colnames; // 列名数组
     private String colsStr="";
     private String[] colTypes; //列名类型数组
     private int[] colSizes; //列名大小数组
     
     private boolean f_util = false; // 是否需要导入包java.util.*
     private boolean f_sql = false; // 是否需要导入包java.sql.*
    //数据库连接
     private static final String URL ="jdbc:mysql://10.4.82.150:3306/mall?useUnicode=true&amp;characterEncoding=utf8";
     private static final String NAME = "root";
     private static final String PASS = "123456";
     private static final String DRIVER ="com.mysql.jdbc.Driver";

     private String suffix = "";
    
     public GenDaoMysql(String packageOutPath, String authorName,String tablename,String suffix) {
          this.packageOutPath = packageOutPath;
          this.authorName = authorName;
          this.tablename = tablename;
          this.suffix = StringUtils.isBlank(suffix)?"":suffix;
          init();
     }

     /**
     * 生成java文件
     */
     public GenDaoMysql toJavaDAO(){
          String content = parse(colnames,colTypes,colSizes);
          System.out.println(content);
          return this;
     }
    
     /**
     * 输出字段名称
     */
     public GenDaoMysql showColumnNames(){
          StringBuffer colsBuf = new StringBuffer();
          if(null!=colnames && colnames.length>0){
               for(String colname:colnames){
                    colsBuf.append("`").append(colname).append("`").append(",");
               }
          }
          colsStr = colsBuf.toString().trim();
          if(colsStr.endsWith(",")){
               colsStr = colsStr.substring(0,colsStr.length()-1);
          }
//          LogUtil.print(colsStr);
          return this;
     }
    
     private void init(){
          //创建连接
         Connection con = null;
          //查要生成实体类的表
         String sql = "select * from " + tablename;
         PreparedStatement pStemt = null;
         try {
              try {
                    Class.forName(DRIVER);
//                   Thread.currentThread().getContextClassLoader().loadClass(DRIVER);
//                   Class.forName(DRIVER, false, GenEntityMysql.class.getClassLoader());
               } catch (ClassNotFoundException e1) {
                    e1.printStackTrace();
               }
               con = DriverManager.getConnection(URL,NAME,PASS);
               pStemt = con.prepareStatement(sql);
               ResultSetMetaData rsmd = pStemt.getMetaData();
               int size = rsmd.getColumnCount();     //统计列
               colnames = new String[size];
               colTypes = new String[size];
               colSizes = new int[size];
               for (int i = 0; i < size; i++) {
                    colnames[i] = rsmd.getColumnName(i + 1);
                    colTypes[i] = rsmd.getColumnTypeName(i + 1);
                   
                    if(colTypes[i].equalsIgnoreCase("datetime") || colTypes[i].equalsIgnoreCase("timestamp")|| colTypes[i].equalsIgnoreCase("date")){
                         f_util = true;
                    }
                    if(colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text")){
                         f_sql = true;
                    }
                    colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
               }
         }catch(Exception e){
              e.printStackTrace();
         }finally{
               try {
                    if(con != null){
                         con.close();
                    }
               } catch (SQLException e) {
                    e.printStackTrace();
               }
         }
     }
        
    
  

     /**
     * 功能：生成实体类主体代码
     * @param colnames
     * @param colTypes
     * @param colSizes
     * @return
     */
     private String parse(String[] colnames, String[] colTypes, int[] colSizes) {
          StringBuffer sb = new StringBuffer();
          sb.append("package " + this.packageOutPath + ";\r\n");
          sb.append("import net.paoding.rose.jade.annotation.DAO;\r\n"
          		  + "import net.paoding.rose.jade.annotation.SQL;\r\n"
          		  + "import com.renren.fenqi.component.constant.Constant;\r\n"
          		  + "import java.util.List;\r\n");
          //判断是否导入工具包
          if(f_util){
               sb.append("import java.util.Date;\r\n");
          }
          if(f_sql){
               sb.append("import java.sql.*;\r\n");
          }
          sb.append("\r\n");
          //注释部分
          sb.append("/**\r\n");
          try {
               sb.append(" * "+this.authorName+"\r\n");
          } catch (Exception e) {
               e.printStackTrace();
          }
          sb.append(" */ \r\n");
          //实体部分
          sb.append("@DAO(catalog=Constant.FENQI_CATALOG)\r\n");
          sb.append("public interface " + initcap(tablename,true) +suffix+ " {\r\n");
          sb.append("\r\n");
          processAllAttrs(sb);//属性
          sb.append("\r\n");
          processAllMethod(sb);//get set方法
          sb.append("}\r\n");
         
         //System.out.println(sb.toString());
          return sb.toString();
     }
    
     /**
     * 功能：生成所有属性
     * @param sb
     */
     private void processAllAttrs(StringBuffer sb) {
    	 //TABLE
    	 sb.append("\tpublic static final String TABLE = \" `"+tablename+"` \";\r\n");
    	 //COLS
    	 sb.append("\tpublic static final String INSERT_COLS = \" "+showColumnNames().colsStr+" \";\r\n");
    	 sb.append("\tpublic static final String SELECT_COLS = \" "+showColumnNames().colsStr+" \";\r\n");
     }

     /**
     * 功能：生成所有方法
     * @param sb
     */
     private void processAllMethod(StringBuffer sb) {
         //getAll方法
    	 sb.append("\t@SQL(\"select \"+SELECT_COLS+\"from\"+TABLE+\"\")\r\n");
         sb.append("\tpublic List<"+initcap(tablename,true)+"> getAll();\r\n\r\n");
    	 
         //getAllById方法
         
    	 //save方法
    	 sb.append("\t@SQL(\"insert into\"+TABLE+\"(\"+INSERT_COLS+\") values( \"\r\n");
    	 for(int i=0;i<colnames.length;i++){
    		 String field = initcap(colnames[i],false);
    		 if(i < colnames.length-1){
    			 sb.append("\t\t+\":1."+field+",\"\r\n");
    		 }else{
    			 sb.append("\t\t+\":1."+field+"\"\r\n");
    		 }
    	 }
    	 sb.append("\t\t+\") on duplicate key update \"\r\n");
    	 for(int i=0;i<colnames.length;i++){
	 		 String field = initcap(colnames[i],false);
	 		 if(i < colnames.length-1){
	 			 sb.append("\t\t+\"`"+colnames[i]+"`=:1."+field+",\"\r\n");
	 		 }else{
	 			 sb.append("\t\t+\"`"+colnames[i]+"`=:1."+field+"\")\r\n");
	 		 }
	 	 }
         sb.append("\tpublic void save("+initcap(tablename,true)+" "+initcap(tablename,false)+");\r\n\r\n");
         
     }
    
     /**
     * 功能：将输入字符串的首字母改成大写
     * @param str
     * @return
     */
     private String initcap(String str,boolean firstCharUpperCase) {
          String[] ary = str.split("_");
          StringBuffer name = new StringBuffer();
          for(String word:ary){
               if(!firstCharUpperCase){
                    firstCharUpperCase = true;
                    name.append(word);
                    continue;
               }
               word = word.length()>1?word.substring(0, 1).toUpperCase()+word.substring(1):word.substring(0, 1).toUpperCase();
               name.append(word);
          }
          return name.toString();
     }

     /**
     * 功能：获得列的数据类型
     * @param sqlType
     * @return
     */
     private String sqlType2JavaType(String sqlType) {
         
          if(sqlType.equalsIgnoreCase("bit")){
               return "boolean";
          }else if(sqlType.equalsIgnoreCase("tinyint")){
               return "byte";
          }else if(sqlType.equalsIgnoreCase("smallint")){
               return "short";
          }else if(sqlType.equalsIgnoreCase("int")){
               return "int";
          }else if(sqlType.equalsIgnoreCase("bigint")){
               return "long";
          }else if(sqlType.equalsIgnoreCase("float")){
               return "float";
          }else if(sqlType.equalsIgnoreCase("decimal")
                    || sqlType.equalsIgnoreCase("numeric")
                    || sqlType.equalsIgnoreCase("real")
                    || sqlType.equalsIgnoreCase("money")
                    || sqlType.equalsIgnoreCase("smallmoney")
                    || sqlType.equalsIgnoreCase("double")){
               return "double";
          }else if(sqlType.equalsIgnoreCase("varchar")
                    || sqlType.equalsIgnoreCase("char")
                    || sqlType.equalsIgnoreCase("nvarchar")
                    || sqlType.equalsIgnoreCase("nchar")
                    || sqlType.equalsIgnoreCase("text")){
               return "String";
          }else if(sqlType.equalsIgnoreCase("datetime")
                    || sqlType.equalsIgnoreCase("timestamp")|| sqlType.equalsIgnoreCase("date")){
               return "Date";
          }else if(sqlType.equalsIgnoreCase("image")){
               return "Blod";
          }
         
          return null;
     }
    
}