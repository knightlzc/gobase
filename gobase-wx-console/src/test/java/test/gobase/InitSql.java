/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: InitSql.java
 * @Package test.gobase
 * @date 2019年7月20日 下午5:59:38 
 */
package test.gobase;

import java.util.Map;
import java.util.TreeMap;

import com.gobase.tools.common.IDCreater;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class InitSql {
	
	public static void main(String[] args) {
////		for (int i = 0; i < 5; i++) {
//			String goodsId = IDCreater.generate("GO");
//			String name = "门垫";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/7257/3/7010/375886/5be2bdc7E58554a96/a43ea43f01e4766e.jpg;https://img14.360buyimg.com/n0/jfs/t1/7661/40/7013/174596/5be2bdf0E8d9b7776/7809dcf94141dfa9.jpg;https://img14.360buyimg.com/n0/jfs/t1/11571/36/279/465428/5be2bdcaEa05990d9/409cafa144a1b854.jpg;";
//			int shopId = 2;
//			int price = 200;
//			String c1="shkj";
//			String c2="rcyp";
//			String c3="xyy";
			Map<String, String> param = new TreeMap<>();
			param.put("产地", "山东");
			param.put("商品毛重", "4kg");
			param.put("质保", "三年");
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
////		}
//		for (int i = 0; i < 5; i++) {
//			String goodsId = IDCreater.generate("GO");
//			String name = "婴儿护肤湿巾";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/37075/31/9690/275466/5cd0f681Ed4023484/3c9b68e6123daad1.jpg;https://img14.360buyimg.com/n0/jfs/t1/33484/30/11146/180865/5cd0f671E1c280266/f88a23f66bc26963.jpg;https://img14.360buyimg.com/n0/jfs/t1/40642/20/4102/253264/5cd0f672Ec4dd5932/8af64bdb7bd8fd33.jpg";
//			int shopId = 2;
//			int price = 50;
//			String c1="shkj";
//			String c2="rcyp";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//		}
//		for (int i = 0; i < 5; i++) {
//			String goodsId = IDCreater.generate("GO");
//			String name = "婴儿安全镊夹";
//			String img = "https://img14.360buyimg.com/n0/jfs/t2284/362/2450760637/137269/e7575209/56d9375cNcb2c7c68.jpg;https://img14.360buyimg.com/n0/jfs/t1993/104/2374557058/35367/88aa54ab/56d9375fNc2adb254.jpg;https://img14.360buyimg.com/n0/jfs/t1912/204/1732672332/46633/9b1f26bd/56d93761N3ebac01f.jpg;";
//			int shopId = 2;
//			int price = 150;
//			String c1="shkj";
//			String c2="rcyp";
//			String c3="yeaqnj";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//		}
//		for (int i = 0; i < 5; i++) {
//			String goodsId = IDCreater.generate("GO");
//			String name = "儿童洗手液";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/36261/2/9944/377262/5cd3a068E3edd0a59/d3f1ca86ba4cbc99.jpg;https://img14.360buyimg.com/n0/jfs/t3190/185/3093913392/201219/d37ec6b9/57eb7173N67773f54.jpg;https://img14.360buyimg.com/n0/jfs/t3142/112/3006802956/205358/dfc3e845/57eb7176N0866412e.jpg";
//			int shopId = 2;
//			int price = 600;
//			String c1="shkj";
//			String c2="rcyp";
//			String c3="etxsy";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//		}
//		for (int i = 0; i < 5; i++) {
//			String goodsId = IDCreater.generate("GO");
//			String name = "空调制冷剂";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/74469/1/2445/143742/5d0b6355E7a27d5ea/dc09215281f3ca84.jpg;https://img14.360buyimg.com/n0/jfs/t1/46889/9/120/76378/5cd2a857E53db494a/ba7499299f1cca29.jpg;https://img14.360buyimg.com/n0/jfs/t1/55649/10/110/61249/5cd2a856E0d58dd06/3296d523799998f7.jpg";
//			int shopId = 2;
//			int price = 300;
//			String c1="shkj";
//			String c2="qcfw";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//		}
//		for (int i = 0; i < 5; i++) {
//			String goodsId = IDCreater.generate("GO");
//			String name = "电子手刹汽车";
//			String img = "https://img14.360buyimg.com/n0/jfs/t3214/329/2234823141/378056/84575d87/57de989eN71176509.jpg;https://img14.360buyimg.com/n0/jfs/t3034/172/2748428777/464538/e24ee0ac/57de989fN4ccc4f2d.jpg;https://img14.360buyimg.com/n0/jfs/t3214/329/2234823141/378056/84575d87/57de989eN71176509.jpg";
//			int shopId = 2;
//			int price = 2000;
//			String c1="shkj";
//			String c2="qcfw";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//		}
//			String goodsId = IDCreater.generate("GO");
//			String name = "17寸及以下轮胎/轮毂安装";
//			String img = "https://img14.360buyimg.com/n0/jfs/t3169/255/5160471885/288436/8883d855/5860cd08Nb7e8e8d8.jpg;https://img14.360buyimg.com/n0/jfs/t3052/305/5603342373/357621/1711bcf9/58798714Nd862e8f1.jpg;https://img14.360buyimg.com/n0/jfs/t3808/227/2443041747/249599/eeb4a34e/585b6bb9Ncd2609aa.jpg";
//			int shopId = 2;
//			int price = 2000;
//			String c1="shkj";
//			String c2="qcfw";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "夏季浴室拖鞋";
//			String img = "https://img14.360buyimg.com/n0/jfs/t4720/124/1275350264/354526/14403418/58ef16ceNf11f77b8.jpg;https://img14.360buyimg.com/n0/jfs/t4774/38/1262867423/259688/51f55e93/58ef16ccN221a19e2.jpg;https://img14.360buyimg.com/n0/jfs/t4564/205/2424412691/281419/8f8eda51/58ef16ceNd248b616.jpg";
//			int shopId = 2;
//			int price = 2000;
//			String c1="cykj";
//			String c2="jiaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "置物架";
//			String img = "https://img14.360buyimg.com/n0/jfs/t18325/194/1878451938/387408/8acd5e0e/5add5873Ne0841ec2.jpg;https://img14.360buyimg.com/n0/jfs/t21493/107/1854521198/270268/1db5f955/5b70fa87Naf6baec4.jpg;https://img14.360buyimg.com/n0/jfs/t16885/228/1940445742/455086/6a6ae1b1/5add5873N8961e2b5.jpg";
//			int shopId = 2;
//			int price = 1230;
//			String c1="cykj";
//			String c2="jiaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "防滑垫";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/17238/36/7546/128413/5c6d35e0Ef6509a69/df61628f2089d3cb.jpg;https://img14.360buyimg.com/n0/jfs/t1/23888/24/7676/92161/5c6d3610Ea24e4fea/211836959c6a779a.jpg;https://img14.360buyimg.com/n0/jfs/t1/20802/39/8672/114287/5c78e79aE302c1632/b91c78f9b6e08dd8.jpg";
//			int shopId = 2;
//			int price = 15;
//			String c1="cykj";
//			String c2="jiaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "墙面缓冲垫";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/43124/3/2814/126242/5ccc02ffE5e616a7a/f65fcaed75c9e15f.jpg;https://img14.360buyimg.com/n0/jfs/t1/42110/13/2737/99764/5ccc02ffE9f54513d/10abe3a6ac751241.jpg;https://img14.360buyimg.com/n0/jfs/t1/34790/3/8437/145391/5ccc02ffEa06814a3/4264296ad93dbc4f.jpg";
//			int shopId = 2;
//			int price = 25;
//			String c1="cykj";
//			String c2="jiaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "收纳整理架子";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/4307/19/292/137143/5b9098dfE0795a4e7/0b379e99b1a209e1.jpg;https://img14.360buyimg.com/n0/jfs/t26650/8/344916161/173721/d88a815e/5b8f6db4N3ab31860.jpg;https://img14.360buyimg.com/n0/jfs/t1/4/2/1258/152928/5b8f6db5Ec79b0c39/df220a592709a152.jpg";
//			int shopId = 2;
//			int price = 220;
//			String c1="cykj";
//			String c2="jiaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "收纳整理架子";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/4307/19/292/137143/5b9098dfE0795a4e7/0b379e99b1a209e1.jpg;https://img14.360buyimg.com/n0/jfs/t26650/8/344916161/173721/d88a815e/5b8f6db4N3ab31860.jpg;https://img14.360buyimg.com/n0/jfs/t1/4/2/1258/152928/5b8f6db5Ec79b0c39/df220a592709a152.jpg";
//			int shopId = 2;
//			int price = 220;
//			String c1="cykj";
//			String c2="jiaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "宝木林实木床";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/79384/25/1731/122984/5d00e6a7E5003ad8c/624ceba06465d39d.jpg;https://img14.360buyimg.com/n0/jfs/t5869/248/4316021858/164941/a26d1f2c/594bce8dN2c6e2516.jpg;https://img14.360buyimg.com/n0/jfs/t6424/257/1149010331/202794/4ceb319f/594bce8eNb1da8607.jpg";
//			int shopId = 2;
//			int price = 300;
//			String c1="cykj";
//			String c2="jaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "北欧卧室家";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/52647/12/1532/464849/5cf4db4fE0b4547f3/2e152ea0179e720f.jpg;https://img14.360buyimg.com/n0/jfs/t1/66787/7/1100/353798/5cf4db50E57ae6c68/4d6fdd69ffc20337.jpg;https://img14.360buyimg.com/n0/jfs/t1/70303/40/1076/420501/5cf4db54E0888920b/52cbe7e4d4643ae5.jpg";
//			int shopId = 2;
//			int price = 5000;
//			String c1="cykj";
//			String c2="jaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "芝华仕真皮沙发";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/39403/14/3064/173074/5cc3d22dE0fbf9a38/f41224aab7b1aa51.jpg;https://img14.360buyimg.com/n0/jfs/t7432/341/2537870913/214714/d59b200a/59b0b6b7N554e2f4a.jpg;https://img14.360buyimg.com/n0/jfs/t7114/122/1512051006/119230/93148f79/598c2b49Ndb66dad9.jpg";
//			int shopId = 2;
//			int price = 50000;
//			String c1="cykj";
//			String c2="jaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "子母床";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/40994/5/8805/662820/5d25578dEc77ac2ec/6f41bfb5ce449928.jpg;https://img14.360buyimg.com/n0/jfs/t1/81031/1/4268/643694/5d25578dEbb0af4f1/ed2c15498509612e.jpg;https://img14.360buyimg.com/n0/jfs/t1/30503/16/6094/99212/5c8c48c6Ef1fcce2d/21b4d2951581d6e5.jpg";
//			int shopId = 2;
//			int price = 4000;
//			String c1="cykj";
//			String c2="jaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
//			String goodsId = IDCreater.generate("GO");
//			String name = "全友餐桌餐桌椅组合";
//			String img = "https://img14.360buyimg.com/n0/jfs/t1/44738/7/5172/303664/5d2de9d7Eef5b9ccf/1de35af0e6f34798.jpg;https://img14.360buyimg.com/n0/jfs/t29038/124/132638815/255069/cc333dd4/5be91b12N128f375c.jpg;https://img14.360buyimg.com/n0/jfs/t27232/252/1646117527/199822/fb305ab9/5be91b12N6b013c6c.jpg";
//			int shopId = 2;
//			int price = 8000;
//			String c1="cykj";
//			String c2="jaju";
//			String c3="";
//			param.put("商品名称", name);
//			param.put("商品编号", goodsId);
//			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
			String goodsId = IDCreater.generate("GO");
			String name = "荣耀20";
			String img = "https://img12.360buyimg.com/n1/s450x450_jfs/t28906/30/1571661431/255345/986f5fcb/5ce4148aN55586a52.jpg;https://img14.360buyimg.com/n0/jfs/t28801/144/1546524315/181570/c837fdbb/5ce414bfN8eabd83f.jpg;https://img14.360buyimg.com/n0/jfs/t28912/121/1591805305/128242/42193c29/5ce414bfN568ef427.jpg";
			int shopId = 2;
			int price = 8000;
			String c1="cykj";
			String c2="jaju";
			String c3="";
			param.put("商品名称", name);
			param.put("商品编号", goodsId);
			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3,param);
	}
	
	public static void printGoodsSql(String goodsId,String name,String img,int shopId,int price,String c1,String c2,String c3,Map<String,String> param) {
		String[] imgs = img.split(";");
		System.out.println("INSERT INTO `goods` (goods_id,tiny_name,full_name,big_img,small_img,category1,category2,category3,shop_id,real_price,description) "
				+ "VALUES ('"+goodsId+"', '"+name+"', '"+name+"', '"+imgs[0]+"', '"+imgs[0]+"', '"+c1+"', '"+c2+"', '"+c3+"',"+shopId+","+price+",'"+name+"' );");
		for (String imgurl : imgs) {
			System.out.println("insert into img (biz_type,biz_id,img_url) values ('1','"+goodsId+"','"+imgurl+"');");
		}
		for (String key : param.keySet()) {
			System.out.println("insert into goods_param (goods_id,param_key,param_value) values ('"+goodsId+"','"+key+"','"+param.get(key)+"');");
		}
		
	}

}
