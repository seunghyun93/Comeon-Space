package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class checkIdServlet
 */
@WebServlet("/checkEmail.me")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//inputId
		String inputEmail = request.getParameter("inputEmail");
		int result = new MemberService().checkEmail(inputEmail);
		
//		request.setAttribute("result", result);
//		request.setAttribute("checkedEmail", inputEmail);
//		
//		request.getRequestDispatcher("WEB-INF/views/member/checkEmailForm.jsp").forward(request, response);
		String msg = "";
		if(result > 0) {
			msg="사용 불가능한 이메일 입니다.";
		} else {
			msg="사용 가능한 이메일 입니다.";
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
