package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class FilmDAO {

	private Connection conn;

	public FilmDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public List<Film> getFilms(String name){
	    List<Film> list = new ArrayList<Film>();
	    Film f = null;
	    
	    try {
		String sql = "select * from film";
		PreparedStatement ps = conn.prepareStatement(sql);
	    

	    ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			f = new Film();
			f.setFilmId(rs.getInt(1));
			f.setTitle(rs.getString(2));
			f.setDescription(rs.getString(3));
			f.setRelaseYear(rs.getDate(4) + "");
			f.setLanguageId(rs.getInt(5));
			f.setLength(rs.getInt(9));
			f.setRating(rs.getString(10));
			list.add(f);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	    return list;
	}  
	public List<Film> getFilmBySearch(String ch) {
		List<Film> list = new ArrayList<Film>();
		Film f = null;

		try {
			String sql = "select * from film where title like ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Film();
				f.setFilmId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setDescription(rs.getString(3));
				f.setRelaseYear(rs.getDate(4) + "");
				f.setLanguageId(rs.getInt(5));
				f.setLength(rs.getInt(9));
				f.setRating(rs.getString(10));
				list.add(f);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Film getFilmById(int id) {

		Film f = null;

		try {
			String sql = "select * from film where film_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = new Film();
				f.setFilmId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setDescription(rs.getString(3));
				f.setRelaseYear(rs.getDate(4) + "");
				f.setLanguageId(rs.getInt(5));
				f.setLength(rs.getInt(9));
				f.setRating(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public int getCategory(int filmId) {
		int categoryId = 0;

		try {
			String sql = "select * from film_category where film_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, filmId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				categoryId = rs.getInt(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return categoryId;
	}

	public String getCategoryName(int cid) {
		String categoryName = "";
		try {
			String sql = "select * from category where category_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				categoryName = rs.getString(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoryName;
	}

	public List<FilmActor> getActorId(int filmId) {
		List<FilmActor> list = new ArrayList<FilmActor>();
		FilmActor fa = null;
		try {
			String sql = "select * from film_actor where film_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, filmId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				fa = new FilmActor();
				fa.setActorId(rs.getInt(1));
				list.add(fa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Actor getActorName(int aid) {
		Actor ac = null;
		try {
			String sql = "select * from actor where actor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, aid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ac = new Actor();
				ac.setFirstName(rs.getString(2));
				ac.setLastName(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ac;
	}
	
	public List<Film> getFilmByTitle(int filmId){
	    List<Film> list = new ArrayList<Film>();
	    Film f =null;
	    try {
		String sql1 = "Select * from films";
		PreparedStatement pse = conn.prepareStatement(sql1);
		pse.setInt(1, filmId);
		ResultSet rs = pse.executeQuery();
		while (rs.next()) {
		    f = new Film();
		    
		}
		
	    }
	    catch (Exception e) {
		e.printStackTrace();
	    }
	    return list;
	    
	}

}
