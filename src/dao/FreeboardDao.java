package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Freeboard;
import mybatis.SqlSessionBean;

public class FreeboardDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static FreeboardDao dao = new FreeboardDao();
	
	private FreeboardDao() { }
	public static FreeboardDao getInstance() {
		return dao;
	}
	//getList
	public List<Freeboard> getList(Map<String, Integer> map){   
							//key(변수명처럼 이해) String, value  는 int
		List<Freeboard> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList",map);
		return list;
	}
	
	//idx로 한개 행 조회
	public Freeboard getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Freeboard dto = mapper.selectOne("selectByIdx", idx);  
		mapper.close();
		return dto;
	}
	
	//테이블 데이터 행의 개수 조회
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("getCount");  
		mapper.close();     
		return cnt;
	}
	
	public int insert(Freeboard dto) {
			SqlSession mapper = factory.openSession();
			mapper.insert("freeboard.insert", dto);    
			mapper.commit();
			mapper.close();
			return dto.getIdx();
		}
	
	public void update(Freeboard dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("update",dto);
		mapper.commit();
		mapper.close();		
	}
	
	public int delete(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("freeboard.delete",map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public Freeboard passwordCheck(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		Freeboard dto = mapper.selectOne("passwordCheck",map);
		mapper.close();
		return dto;
	}

	public void readCount(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("readCount",idx);
		mapper.commit();
		mapper.close();		
	}
	
	
	
	
	
	
	
}//전체 end
