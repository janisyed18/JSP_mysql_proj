package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class ActorDAO {

	private Connection conn;

	public ActorDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public List<Actor> getActorBySearch(String che) {
		List<Actor> list = new ArrayList<Actor>();
		Actor a = null;

		try {
			String sql = "select * from actor where first_name like ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + che + "%");

			ResultSet rse = ps.executeQuery();
			while (rse.next()) {
				a = new Actor();
				a.setActorId(rse.getInt(1));
				a.setFirstName(rse.getString(2));
				a.setLastName(rse.getString(3));
				a.setLastupdate(rse.getDate(4) + "");
				list.add(a);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Actor getActorById(int id) {

		Actor a = null;

		try {
			String sql = "select * from film where film_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a = new Actor();
				a.setActorId(rs.getInt(1));
				a.setFirstName(rs.getString(2));
				a.setLastName(rs.getString(3));
				a.setLastupdate(rs.getDate(4) + "");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	public int getFilmId(int actorId) {
		int filmId = 0;

		try {
			String sql = "select * from film_actor where actor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, actorId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				filmId = rs.getInt(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return filmId;
	}

	public String getFilmName(int cid) {
		String FilmName = "";
		try {
			String sql = "select * from film where film_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FilmName = rs.getString(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return FilmName;
	}

	public List<Film> getFilmId1(int actorId) {
		List<Film> list = new ArrayList<Film>();
		Film fa = null;
		try {
			String sql = "select * from film_actor where actor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, actorId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				fa = new Film();
				fa.setFilmId(rs.getInt(1));
				list.add(fa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Film getFilmName1(int fid) {
		Film ac = null;
		try {
			String sql = "select * from film where film_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, fid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ac = new Film();
				ac.setTitle(rs.getString(2));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ac;
	}

}

