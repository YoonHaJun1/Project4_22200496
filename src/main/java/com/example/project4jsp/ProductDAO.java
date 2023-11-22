package com.example.project4jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private final String P_INSERT = "insert into Product(name, price, type, num, size, seller, country) values(?,?,?,?,?,?,?)";
    private final String P_UPDATE = "update Product set name=?, price=?, type=?, num=?, size=?, seller=?, country=? where id=?";
    private final String P_DELETE = "delete from Product where id=?";
    private final String P_GET = "select * from Product where id=?";
    private final String P_LIST = "select * from Product order by id desc";

    public int insertProduct(ProductVO data) {
        int result = 0;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(P_INSERT);
//            stmt.setString(1, data.getPhoto());
            stmt.setString(1, data.getName());
            stmt.setInt(2, data.getPrice());
            stmt.setString(3, data.getType());
            stmt.setInt(4, data.getNum());
            stmt.setString(5, data.getSize());
            stmt.setString(6, data.getSeller());
            stmt.setString(7, data.getCountry());
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } return result;
    }

    public int updateProduct(ProductVO data) {
        int result = 0;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(P_UPDATE);
            stmt.setString(1, data.getName());
            stmt.setInt(2, data.getPrice());
            stmt.setString(3, data.getType());
            stmt.setInt(4, data.getNum());
            stmt.setString(5, data.getSize());
            stmt.setString(6, data.getSeller());
            stmt.setString(7, data.getCountry());
            result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

        public void deleteProduct (ProductVO data) {
            try {
                conn = JDBCUtil.getConnection();
                stmt = conn.prepareStatement(P_DELETE);
                stmt.setInt(1, data.getId());
                stmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public ProductVO getProduct(int id) {
            ProductVO one = null;
            conn = JDBCUtil.getConnection();
            try {
                stmt = conn.prepareStatement(P_GET);
                stmt.setInt(1, id);
                rs = stmt.executeQuery();
                        if(rs.next()) {
                            one = new ProductVO();
                            one.setId(rs.getInt("id"));
                            one.setName(rs.getString("name"));
                            one.setPrice(rs.getInt("price"));
                            one.setType(rs.getString("type"));
                            one.setNum(rs.getInt("num"));
                            one.setSize(rs.getString("size"));
                            one.setSeller(rs.getString("seller"));
                            one.setCountry(rs.getString("country"));
                            one.setRegdate(rs.getDate("regdate"));
                        }
                        rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } return one;
        }

        public ArrayList<ProductVO> getProductList() {
            ArrayList<ProductVO> list = null;
            conn = JDBCUtil.getConnection();
            try {
                stmt = conn.prepareStatement(P_LIST);
                rs = stmt.executeQuery();
                list = new ArrayList<ProductVO>();
                ProductVO one = new ProductVO();
                while(rs.next()) {
                    one = new ProductVO();
                    one.setId(rs.getInt("id"));
                    one.setName(rs.getString("name"));
                    one.setPrice(rs.getInt("price"));
                    one.setType(rs.getString("type"));
                    one.setNum(rs.getInt("num"));
                    one.setSize(rs.getString("size"));
                    one.setSeller(rs.getString("seller"));
                    one.setCountry(rs.getString("country"));
                    one.setRegdate(rs.getDate("regdate"));
                    list.add(one);
                }
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } return list;
        }

        public String getPhotoFilename(int id) {
        String filename = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(P_GET);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if(rs.next()) {
                filename = rs.getString("photo");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } return filename;
        }
}

