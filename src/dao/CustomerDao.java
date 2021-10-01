package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Comment;
import dto.Customer;
import dto.Freeboard;
import mybatis.SqlSessionBean;

public class CustomerDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CustomerDao dao = new CustomerDao();
	
	private CustomerDao() { }
	public static CustomerDao getInstance() {
		return dao;
	}

	public Customer login(Map<String, String> map) {
		Customer dto = null;
		SqlSession mapper= factory.openSession();
		dto = mapper.selectOne("loginCheck",map);
		return dto;
	}

}
