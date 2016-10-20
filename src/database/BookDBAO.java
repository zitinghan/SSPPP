/*
 * Copyright (c) 2006 Sun Microsystems, Inc.  All rights reserved.  U.S.
 * Government Rights - Commercial software.  Government users are subject
 * to the Sun Microsystems, Inc. standard license agreement and
 * applicable provisions of the FAR and its supplements.  Use is subject
 * to license terms.
 *
 * This distribution may include materials developed by third parties.
 * Sun, Sun Microsystems, the Sun logo, Java and J2EE are trademarks
 * or registered trademarks of Sun Microsystems, Inc. in the U.S. and
 * other countries.
 *
 * Copyright (c) 2006 Sun Microsystems, Inc. Tous droits reserves.
 *
 * Droits du gouvernement americain, utilisateurs gouvernementaux - logiciel
 * commercial. Les utilisateurs gouvernementaux sont soumis au contrat de
 * licence standard de Sun Microsystems, Inc., ainsi qu'aux dispositions
 * en vigueur de la FAR (Federal Acquisition Regulations) et des
 * supplements a celles-ci.  Distribue par des licences qui en
 * restreignent l'utilisation.
 *
 * Cette distribution peut comprendre des composants developpes par des
 * tierces parties. Sun, Sun Microsystems, le logo Sun, Java et J2EE
 * sont des marques de fabrique ou des marques deposees de Sun
 * Microsystems, Inc. aux Etats-Unis et dans d'autres pays.
 */

package database;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class BookDBAO {
	private ArrayList books;
	Connection con;

	public BookDBAO() throws Exception {
		try {
			DB db = new DB();
			con = db.getConnection();
		} catch (Exception ex) {
			System.out.println("Exception in BookDBAO: " + ex);
			throw new Exception("Couldn't open connection to database: "
					+ ex.getMessage());
		}
	}

	public void remove() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}

	public List getBooks() throws SQLException {
		books = new ArrayList();

		try {
			String selectStatement = "select * " + "from books";
			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				BookDetails bd = new BookDetails(rs.getString(1),
						rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getFloat(5), rs.getBoolean(6), rs.getInt(7),
						rs.getString(8), rs.getInt(9));

				if (rs.getInt(9) > 0) {
					books.add(bd);
				}
			}

			prepStmt.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}

		Collections.sort(books);
		return books;
	}

	public BookDetails getBookDetails(String bookId) throws SQLException {
		String selectStatement = "select * " + "from books where id = ? ";
		PreparedStatement prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, bookId);

		ResultSet rs = prepStmt.executeQuery();

		if (rs.next()) {
			BookDetails bd = new BookDetails(rs.getString(1), rs.getString(2),
					rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getBoolean(6), rs.getInt(7), rs.getString(8),
					rs.getInt(9));
			prepStmt.close();

			return bd;
		} else {
			prepStmt.close();
			return null;
		}
	}
	
	public List getBooksByTitle(String bookTitle) throws SQLException {
		books = new ArrayList();
		try {
		
			String selectStatement = "select * from books where title LIKE ? ";
			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1,bookTitle+"%");

			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				BookDetails bd = new BookDetails(rs.getString(1),
				rs.getString(2), rs.getString(3), rs.getString(4),
				rs.getFloat(5), rs.getBoolean(6), rs.getInt(7),
				rs.getString(8), rs.getInt(9));

				if (rs.getInt(9) > 0) {
					books.add(bd);
				}
			}
			prepStmt.close();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}
	
		Collections.sort(books);
		return books;

	}

}
