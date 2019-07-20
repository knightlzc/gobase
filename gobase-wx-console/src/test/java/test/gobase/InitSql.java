/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p>
 * <p>Author:zcliu/刘子萃</p>
 * @Title: InitSql.java
 * @Package test.gobase
 * @date 2019年7月20日 下午5:59:38 
 */
package test.gobase;

import com.gobase.tools.common.IDCreater;

/** 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:  </p> 
 * <p>Author:zcliu/刘子萃</p>
 */
public class InitSql {
	
	public static void main(String[] args) {
		for (int i = 0; i < 15; i++) {
			String goodsId = IDCreater.generate("GO");
			String name = "蓝月亮";
			String img = "https://wx.apricot32.cn/img/2019/07/20/img08000001907201824.jpg";
			int shopId = 2;
			int price = i*100;
			String c1="shkj";
			String c2="rcyp";
			String c3="xyy";
			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3);
		}
		for (int i = 0; i < 15; i++) {
			String goodsId = IDCreater.generate("GO");
			String name = "佳洁士";
			String img = "https://wx.apricot32.cn/img/2019/07/20/img08000011907201832.jpg";
			int shopId = 2;
			int price = i*100;
			String c1="shkj";
			String c2="rcyp";
			String c3="ys";
			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3);
		}
		for (int i = 0; i < 15; i++) {
			String goodsId = IDCreater.generate("GO");
			String name = i*10+"元优惠券";
			String img = "https://wx.apricot32.cn/img/2019/07/20/img08000011907201832.jpg";
			int shopId = 2;
			int price = i*10;
			String c1="shkj";
			String c2="rcyp";
			String c3="ys";
			printGoodsSql(goodsId, name, img, shopId, price, c1, c2, c3);
		}
	}
	
	public static void printGoodsSql(String goodsId,String name,String img,int shopId,int price,String c1,String c2,String c3) {
		System.out.println("INSERT INTO `goods` (goods_id,tiny_name,full_name,big_img,small_img,category1,category2,category3,shop_id,real_price) "
				+ "VALUES ('"+goodsId+"', '"+name+"', '"+name+"', '"+img+"', '"+img+"', '"+c1+"', '"+c2+"', '"+c3+"',"+shopId+","+price+" );");
		
	}

}
