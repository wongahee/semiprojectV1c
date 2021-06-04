package gahee.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gahee.spring.vo.SungJuk;

@Repository("sjdao")
public class SungJukDAOImpl implements SungJukDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertSungJuk(SungJuk sj) {
		return sqlSession.insert("sungjuk.insertSungjuk", sj);
	}

	@Override
	public List<SungJuk> selectAllSungJuk() {
		return sqlSession.selectList("sungjuk.selectSungjuk");
	}

	@Override
	public SungJuk selectOneSungJuk(int sjno) {
		return null;
	}

	@Override
	public int updateSungJuk(SungJuk sj) {
		return 0;
	}

	@Override
	public int deleteSungJuk(int i) {
		return 0;
	}
	
}