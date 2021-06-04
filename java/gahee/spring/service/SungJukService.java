package gahee.spring.service;

import java.util.List;

import gahee.spring.vo.SungJuk;

public interface SungJukService {
	int newSungJuk(SungJuk sj);
	
	List<SungJuk> readAllSungJuk();
	
	SungJuk readOneSungJuk(int sjno);
	int modifySungJuk();
	int removeSungJuk();
	
	void computeSungJuk(SungJuk sj);
}
