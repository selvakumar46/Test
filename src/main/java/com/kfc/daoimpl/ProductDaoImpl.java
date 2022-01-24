package com.kfc.daoimpl;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kfc.dao.ProductDao;
import com.kfc.model.Orders;
import com.kfc.model.Products;
import com.kfc.util.ConnectionUtil;

public class ProductDaoImpl implements ProductDao {
	public List<Products> showProduct() {
		List<Products> listOfProducts = new ArrayList<Products>();
//		
		String query = "select * from products_kfc where product_status='Available'";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		Statement stmt;
		Products products = null;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
//				listOfProducts.add(product);
//				System.out.format("%-5s%-27s%-6s%-10s%-5s%-8s%-7s%-9s", "name=", rs.getString(2), "price=",
//						rs.getDouble(4), "type-", rs.getString(5), "Status-", rs.getString(6));
//				System.out.println();
				listOfProducts.add(products);
//				System.out.println(listOfProducts);

			}
			return listOfProducts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listOfProducts;

	}

	public Products validateProduct(String selectProduct) {
		Products productValid = null;
		String validatePro = "select * from products_kfc where product_name=?";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(validatePro);
			pstmt.setString(1, selectProduct);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
//				System.out.println("Valid Product");

				productValid = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6));
				return productValid;
			} else {
				System.out.println("invalid Products");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productValid;

	}

	public boolean deleteProduct(Products products) {

		String delProd = "delete  from products_kfc where product_id=?";
//		System.out.println(products.getProductName() );
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		Products productDelete = null;
		boolean flag = false;
		try {
			pstmt = con.prepareStatement(delProd);
			pstmt.setInt(1, products.getProductId());

			int i = pstmt.executeUpdate();
//			System.out.println(i + "product  deleted Succesfully");
			if (i > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public boolean updateProduct(Products products) {

		String updateProduct = "update products_kfc set product_status=? where product_name=? ";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
//		System.out.println(products.getProductName());
//		System.out.println(products.getProductStatus());
		PreparedStatement pstmt;

		try {
			pstmt = con.prepareStatement(updateProduct);
			pstmt.setString(1, products.getProductStatus());
			pstmt.setString(2, products.getProductName());
			int i = pstmt.executeUpdate();
//			System.out.println(i + "product Status Update Successfully");

			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public boolean insertProducts(Products productInsert) {

		String insert = "insert into products_kfc(product_name,description,product_price,product_type,product_status,catogory) values (?,?,?,?,?,?)";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		Products product = null;
		try {
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, productInsert.getProductName());
			pstmt.setString(2, productInsert.getDescription());
			pstmt.setDouble(3, productInsert.getPrice());
			pstmt.setString(4, productInsert.getProductType());
			pstmt.setString(5, productInsert.getProductStatus());
			pstmt.setString(6, productInsert.getProductCatogory());
			int i = pstmt.executeUpdate();
//			System.out.println(i + "product Update Successfully");
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public Products validateProduct1(Products product) {
		Products productValid = null;
		String validatePro = "select * from products_kfc where product_id=?";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(validatePro);
			pstmt.setInt(1, product.getProductId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
//				System.out.println("Valid Product");

				productValid = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6));
				return productValid;
			} else {
				System.out.println("invalid Products");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productValid;

	}

	public List<Products> showTrending() {
		List<Products> listOfProducts = new ArrayList<Products>();
//		
		String query = "select * from products_kfc where catogory='Trending' and product_status='Available'";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		Statement stmt;
		Products products = null;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6));
				listOfProducts.add(products);
//				System.out.println(listOfProducts);

			}
			return listOfProducts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listOfProducts;

	}

	public List<Products> showBucket() {
		List<Products> listOfProducts = new ArrayList<Products>();
//		
		String query = "select * from products_kfc where catogory='Bucket Meals' and product_status='Available'";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		Statement stmt;
		Products products = null;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6));
				listOfProducts.add(products);
//				System.out.println(listOfProducts);

			}
			return listOfProducts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listOfProducts;

	}

	public List<Products> showProductAdmin() {
		List<Products> listOfProducts = new ArrayList<Products>();
//		
		String query = "select * from products_kfc ";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		Statement stmt;
		Products products = null;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6));
				listOfProducts.add(products);
//				System.out.println(listOfProducts);

			}
			return listOfProducts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listOfProducts;

	}

	public boolean updatePrice(Products products) {

		String updateProduct = "update products_kfc set product_price=? where product_name=? ";
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
//		System.out.println(products.getProductName());
//		System.out.println(products.getProductStatus());
		PreparedStatement pstmt;

		try {
			pstmt = con.prepareStatement(updateProduct);
			pstmt.setDouble(1, products.getPrice());
			pstmt.setString(2, products.getProductName());
			int i = pstmt.executeUpdate();
//			System.out.println(i + "product Status Update Successfully");

			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public List<Products> serachProduct(String proName) {
		String pro = "select * from PRODUCTS_KFC where lower(product_name ) like '" + proName + "%' ";
		List<Products> listOfProducts = new ArrayList<Products>();
		Products products = null;
		ConnectionUtil conect = new ConnectionUtil();
		Connection con = conect.getDBConnection();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(pro);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				listOfProducts.add(products);

			}
			return listOfProducts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listOfProducts;
	}

}
