package com.Dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.Model.Note;
import com.Model.User;

public class UserDao {

	private static String url = "jdbc:mysql://localhost:3306/enotes";
	private static String user = "root";
	private static String password = "riyaz";
	private static Connection con = null;
	private static PreparedStatement ps = null;
	private static String insert = "insert into user(name,email,password)values(?,?,?)";
	private static String loginUser = "select * from user where email=? and password=?";
	private static String saveNote = "insert into note(title,content,uid)values(?,?,?)";
	private static String displayNote = "select * from note where uid=? order by id DESC";
	private static String editNote = "select * from note where id=?";
	private static String updateNote = "update note set title=?,content=? where id=? ";
	private static String deleteNote = "delete from note where id=?";

	// User Login
	public static User loginUser(User u) {
		User userd = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(loginUser);
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				userd = new User(id, name, email, password);
			}

		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userd;

	}

	// User Registration
	public static boolean userRegister(User u) {
		boolean f = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(insert);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return f;

	}

	// Add Notes
	public static boolean addNote(String ti, String co, int ui) {
		boolean f = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(saveNote);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return f;

	}

	// Display data
	public static ArrayList<Note> displayContact(int uid) {
		ArrayList<Note> al = new ArrayList<Note>();
		Note c = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(displayNote);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp date = rs.getTimestamp("date");

				c = new Note(id, title, content, date);
				al.add(c);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;

	}

	// editNotes

	public static Note editNoteById(int id1) {
		Note n = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(editNote);
			ps.setInt(1, id1);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int id = rs.getInt("id");
			String title = rs.getString("title");
			String content = rs.getString("content");
			n = new Note(id, title, content);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return n;

	}

	// update note
	public static boolean updateNote(int nid, String ti, String co) {
		boolean f = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(updateNote);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, nid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return f;
	}

	// delete contact
	public static boolean deleteNote(int nid) {
		boolean f = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(deleteNote);
			ps.setInt(1, nid);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return f;
	}

}
