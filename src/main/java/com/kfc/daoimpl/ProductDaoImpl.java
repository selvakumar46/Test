package com.kfc.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kfc.dao.ProductDao;
import com.kfc.model.Products;
import com.kfc.util.ConnectionUtil;

public class ProductDaoImpl implements ProductDao {
	public List<Products> showProduct() {
		List<Products> listOfProducts = new ArrayList<Products>();
		ResultSet rs = null;
		String query = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from products_kfc where product_status='Available'";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		Products products = null;
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				listOfProducts.add(products);
			}
			return listOfProducts;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}

		return listOfProducts;

	}

	public Products validateProduct(Products products) {
		Products productValid = null;
		ResultSet rs = null;
		String validatePro = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from products_kfc where product_name=?";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(validatePro);
			pstmt.setString(1, products.getProductName());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productValid = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
			return productValid;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return productValid;

	}

	public boolean deleteProduct(Products products) {

		String delProd = "delete  from products_kfc where product_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			pstmt = con.prepareStatement(delProd);
			pstmt.setInt(1, products.getProductId());

			int i = pstmt.executeUpdate();
			if (i > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}

		return flag;
	}

	public boolean updateProduct(Products products) {

		String updateProduct = "update products_kfc set product_status=? where product_name=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(updateProduct);
			pstmt.setString(1, products.getProductStatus());
			pstmt.setString(2, products.getProductName());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}

		return false;
	}

	public boolean insertProducts(Products productInsert) {

		String insert = "insert into products_kfc(product_name,description,product_price,product_type,product_status,catogory) values (?,?,?,?,?,?)";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, productInsert.getProductName());
			pstmt.setString(2, productInsert.getDescription());
			pstmt.setDouble(3, productInsert.getPrice());
			pstmt.setString(4, productInsert.getProductType());
			pstmt.setString(5, productInsert.getProductStatus());
			pstmt.setString(6, productInsert.getProductCatogory());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}

		return false;
	}

	public Products validateProduct1(Products product) {
		Products productValid = null;
		ResultSet rs = null;
		String validatePro = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from products_kfc where product_id=?";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(validatePro);
			pstmt.setInt(1, product.getProductId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productValid = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
			return productValid;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return productValid;

	}

	public List<Products> showTrending() {
		List<Products> listOfProducts = new ArrayList<Products>();
		ResultSet rs = null;
		String query = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from products_kfc where catogory='Trending' and product_status='Available'";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		Products products = null;
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				listOfProducts.add(products);
			}
			return listOfProducts;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return listOfProducts;

	}

	public List<Products> showBucket() {
		List<Products> listOfProducts = new ArrayList<Products>();
		ResultSet rs = null;
		String query = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from products_kfc where catogory='Bucket Meals' and product_status='Available'";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		Products products = null;
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				listOfProducts.add(products);
			}
			return listOfProducts;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}

		return listOfProducts;

	}

	public List<Products> showProductAdmin() {
		List<Products> listOfProducts = new ArrayList<Products>();
		ResultSet rs = null;
		String query = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from products_kfc ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		Products products = null;
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery(query);
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				listOfProducts.add(products);
			}
			return listOfProducts;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return listOfProducts;

	}

	public boolean updatePrice(Products products) {

		String updateProduct = "update products_kfc set product_price=? where product_name=? ";
		Connection con = ConnectionUtil.getDBConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(updateProduct);
			pstmt.setDouble(1, products.getPrice());
			pstmt.setString(2, products.getProductName());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con);
		}

		return false;
	}

	public List<Products> searchProduct(String proName) {
		String pro = "select product_id,product_name,description,product_price,product_type,product_status,catogory,product_img from PRODUCTS_KFC where product_name  like '"
				+ proName + "%'";
		List<Products> listOfProducts = new ArrayList<Products>();
		Products products = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = ConnectionUtil.getDBConnection();
		try {
			pstmt = con.prepareStatement(pro);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));

				listOfProducts.add(products);

			}
			return listOfProducts;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(pstmt, con, rs);
		}
		return listOfProducts;
	}

	@Override
	public List<Products> serachProduct(String proName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Products validateProduct(String selectProduct) {
		// TODO Auto-generated method stub
		return null;
	}

}
