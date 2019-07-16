package fastdev;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.util.StringUtils;

import com.gobase.tools.date.DateUtils;

/**
* 自动生成Bean java文件
* 适合maven目录结构
* @author dongyu.cai
*
*/
public class GenBeanMysql {
     public static void main(String[] args) {
         
          String packageOutPath = "com.renren.fenqi.admin.component.model.car";
          String authorName = "zicui.liu/刘子萃";
          String tablename = "order";
         
//          new GenEntityMysql(packageOutPath,authorName,tablename).toJavaBean().showColumnNames();
          new GenBeanMysql(packageOutPath,authorName,tablename,"").toJavaBean();
         
     }
    
     private String packageOutPath = "";//指定实体生成所在包的路径
     private String authorName = "";//作者名字
     private String tablename = "";//表名
     private String[] colnames; // 列名数组
     private String[] colTypes; //列名类型数组
     private int[] colSizes; //列名大小数组
     private String[] colDesc; //列名注释
     private boolean f_util = false; // 是否需要导入包java.util.*
     private boolean f_sql = false; // 是否需要导入包java.sql.*
    //数据库连接
     private static final String URL ="jdbc:mysql://10.4.82.150:3306/mall?useUnicode=true&amp;characterEncoding=utf8";
     private static final String NAME = "root";
     private static final String PASS = "123456";
     private static final String DRIVER ="com.mysql.jdbc.Driver";

     private String suffix = "";
    
     public GenBeanMysql(String packageOutPath, String authorName,String tablename,String suffix) {
          this.packageOutPath = packageOutPath;
          this.authorName = authorName;
          this.tablename = tablename;
          this.suffix = StringUtils.isEmpty(suffix)?"":suffix;
          init();
     }

     /**
     * 生成java文件
     */
     public GenBeanMysql toJavaBean(){
          String content = parse(colnames,colTypes,colSizes);
         
          try {
               File directory = new File("");
               //System.out.println("绝对路径："+directory.getAbsolutePath());
               //System.out.println("相对路径："+directory.getCanonicalPath());
//               String path=this.getClass().getResource("").getPath();
              
//               System.out.println(path);
//               System.out.println("src/?/"+path.substring(path.lastIndexOf("/com/", path.length())) );
//               String outputPath = directory.getAbsolutePath()+ "/src/"+path.substring(path.lastIndexOf("/com/", path.length()), path.length()) + initcap(tablename) + ".java";
//               String outputPath = directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutPath.replace(".", "/")+"/";
               String javaFileName = initcap(tablename,true) +suffix+ ".java";
//               File file = new File(outputPath+javaFileName);
//               int fileLastIndex = 1;
//               if(file.exists()){
//                    String backUpJavaFileName = initcap(tablename,true) + "("+fileLastIndex+++").java";
//                    File backUpfile = new File(outputPath+backUpJavaFileName);
//                    while(backUpfile.exists()){
//                         backUpJavaFileName = initcap(tablename,true) + "("+fileLastIndex+++").java";
//                         backUpfile = new File(outputPath+backUpJavaFileName);
//                    }
//                    LogUtil.print("类已存在，原文件已备份:"+backUpJavaFileName);
//                    file.renameTo(backUpfile);
//               }
//               LogUtil.printParams(outputPath+javaFileName);
//               FileWriter fw = new FileWriter(outputPath+javaFileName);
//               PrintWriter pw = new PrintWriter(fw);
//               pw.println(content);
//               pw.flush();
//               pw.close();
                 System.out.println(content);
          } catch (Exception e) {
               e.printStackTrace();
          }
          return this;
     }
    
     /**
     * 输出字段名称
     */
     public GenBeanMysql showColumnNames(){
          StringBuffer colsBuf = new StringBuffer();
          if(null==colnames || colnames.length<=0){
               for(String colname:colnames){
                    colsBuf.append("`").append(colname).append("`").append(",");
               }
          }
          String colsStr = colsBuf.toString().trim();
          if(colsStr.endsWith(",")){
               colsStr = colsStr.substring(0,colsStr.length()-1);
          }
          System.out.println(colsStr);
          return this;
     }
    
     private void init(){
          //创建连接
         Connection con = null;
          //查要生成实体类的表
         String sql = "select * from `" + tablename+"`";
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
               colDesc = new String[size];
               colSizes = new int[size];
               for (int i = 0; i < size; i++) {
                    colnames[i] = rsmd.getColumnName(i + 1);
                    colTypes[i] = rsmd.getColumnTypeName(i + 1);
                   
                    if(colTypes[i].equalsIgnoreCase("datetime") || colTypes[i].equalsIgnoreCase("timestamp") || colTypes[i].equalsIgnoreCase("date") ){
                         f_util = true;
                    }
                    if(colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text")){
                         f_sql = true;
                    }
                    colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
                    String col_sql = "select COLUMN_COMMENT from INFORMATION_SCHEMA.COLUMNS  WHERE TABLE_NAME = '"+tablename+"' AND COLUMN_NAME = '"+colnames[i]+"';";
                    pStemt = con.prepareStatement(col_sql);
                    ResultSet rs = pStemt.executeQuery();
                    while (rs.next()) {
                    	colDesc[i] = rs.getString(1);
					}
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
          sb.append("import java.io.Serializable;\r\n");
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
               sb.append(" * "+this.authorName+" "+DateUtils.getDateToString(new Date(),"yyyy-MM-dd hh:mm:ss")+"\r\n");
          } catch (Exception e) {
               e.printStackTrace();
          }
          sb.append(" */ \r\n");
          //实体部分
//          sb.append("@TableName(tableName=\""+tablename+"\")\r\n");
          sb.append("public class " + initcap(tablename,true) +suffix+ " implements Serializable{\r\n");
          sb.append("\tprivate static final long serialVersionUID =0;\r\n");
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
         
          for (int i = 0; i < colnames.length; i++) {
        	  sb.append("\n");
        	  sb.append("\t/**\n");
        	  sb.append("\t*"+colDesc[i]+"\n");
        	  sb.append("\t*/\n");
//        	  sb.append("\t@Colum(columName=\""+colnames[i]+"\")\n");
               sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + initcap(colnames[i],false));
               if("String".equals(sqlType2JavaType(colTypes[i]))){
                    sb.append("=\"\"");
               }
               sb.append(";\r\n");
          }
         
     }

     /**
     * 功能：生成所有方法
     * @param sb
     */
     private void processAllMethod(StringBuffer sb) {
         
          for (int i = 0; i < colnames.length; i++) {
               sb.append("\tpublic void set" + initcap(colnames[i],true) + "(" + sqlType2JavaType(colTypes[i]) + " " +
                         initcap(colnames[i],false) + "){\r\n");
               sb.append("\t\tthis." + initcap(colnames[i],false) + "=" + initcap(colnames[i],false) + ";\r\n");
               sb.append("\t}\r\n");
               sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i],true) + "(){\r\n");
               sb.append("\t\treturn " + initcap(colnames[i],false) + ";\r\n");
               sb.append("\t}\r\n");
          }
         
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
               return "int";
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