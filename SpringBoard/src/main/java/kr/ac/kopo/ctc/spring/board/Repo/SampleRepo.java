package kr.ac.kopo.ctc.spring.board.Repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.spring.board.RIO.Sample;

@Repository
public interface SampleRepo extends JpaRepository<Sample, Long>, JpaSpecificationExecutor<Sample> {
	List<Sample> findAllByTitle(String title);
	Page<Sample> findAllByTitle(String title, Pageable pageable);
}
