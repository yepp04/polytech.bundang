package dao;

import java.sql.SQLException;

import domain.Notice2;
import service.NoticeService2;

public class Main {
	public static void main(String[] args) throws SQLException {
		NoticeService2 service = new NoticeService2(); // 인스턴스 생성
		int total = 0;
		for (Notice2 n : service.selectAll()) {
			total++;
		}
		System.out.println(total);
		}

	}
