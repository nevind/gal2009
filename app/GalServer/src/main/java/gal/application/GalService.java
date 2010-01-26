package gal.application;

import gal.needleman.wunsch.RequestDTO;
import gal.needleman.wunsch.ResultDTO;

public interface GalService {
	public ResultDTO runSequence(RequestDTO requestDto);
}
