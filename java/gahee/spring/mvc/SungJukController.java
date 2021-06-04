package gahee.spring.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gahee.spring.service.SungJukService;
import gahee.spring.vo.SungJuk;

@Controller
public class SungJukController {

	@Autowired
	private SungJukService sjsrv;
	
	@RequestMapping("/sungjuk")	// get방식으로 호출
	public String sungjuk() {
		return "sungjuk.tiles";
	}

	@RequestMapping(value="/sungjuk", method=RequestMethod.POST) // post방식으로 호출
	public ModelAndView sungjukok(SungJuk sj) {
		
		sjsrv.computeSungJuk(sj);
		
		// 컨트롤러에서 처리한 결과를 뷰에 넘기려면
		// 뷰 이름과 뷰에 보여줄 데이터를 
		// ModelAndView 객체에 담아 처리하면됨
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sungjukok.tiles");
		mv.addObject("sj", sj);

		return mv;
	}

	@RequestMapping(value="/sungjuk2", method=RequestMethod.POST)
	public ModelAndView sungjukok2(SungJuk sj, ModelAndView mv) {

		mv.setViewName("sungjukok2.tiles");
		mv.addObject("sj", sjsrv.newSungJuk(sj));

		return mv;
	}

	@RequestMapping(value="/sungjuk2list")
	public ModelAndView sungjuklist(ModelAndView mv) {
		
		mv.setViewName("sungjuklist.tiles");
		mv.addObject("sjs", sjsrv.readAllSungJuk());
		
		return mv;
	}

}