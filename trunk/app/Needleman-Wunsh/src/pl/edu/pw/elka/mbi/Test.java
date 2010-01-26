/**
 * 
 */
package pl.edu.pw.elka.mbi;

/**
 *
 */
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		double[][] similarityMatrix = {	{10,-3,-1,-4},
										{-3, 9,-5, 0},
										{-1,-5, 7,-3},
										{-4, 0,-3, 8}};
//		double[][] similarityMatrix = {	{ 1,-1,-1,-1},
//										{-1, 1,-1,-1},
//										{-1,-1, 1,-1},
//										{-1,-1,-1, 1}};
		double gapPenalty = -2;
		RequestDTO request = new RequestDTO();
		request.setGapPenalty(gapPenalty);
		request.setSimilarityMatrix(similarityMatrix);
//		request.setSequence1("ATGC");
//		request.setSequence2("ATTGC");
		request.setSequence1("AAACCTGAGACTTGAAAGAAAGAAAGAAAGAAAGAAAGAAAGAAAGAAAGAAAGAAAGAAAGAAA");
		request.setSequence2("ACCTAGAACCTGAGACTTGAAA");
		NeedlemanWunsch nw = new NeedlemanWunsch(request);
		nw.run();
	}

}
