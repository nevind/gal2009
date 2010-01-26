package gal.application;

import org.slf4j.Logger;

import gal.needleman.wunsch.NeedlemanWunsch;
import gal.needleman.wunsch.RequestDTO;
import gal.needleman.wunsch.ResultDTO;

public class GalServiceImpl implements GalService {
	public Logger log;

	public Logger getLog() {
		return log;
	}

	public void setLog(Logger log) {
		this.log = log;
	}

	public ResultDTO runSequence(RequestDTO requestDto) {
		log.debug("Similarity matrix:");
		log.debug("" + requestDto.getSimilarityMatrix());
		NeedlemanWunsch needlemanWunsch = new NeedlemanWunsch(requestDto);
		needlemanWunsch.run();
		ResultDTO result = needlemanWunsch.getResult();
		return result;
	}
}
