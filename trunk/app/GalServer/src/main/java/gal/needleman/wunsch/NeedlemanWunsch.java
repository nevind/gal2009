/**
 * 
 */
package gal.needleman.wunsch;

import java.util.ArrayList;
import java.util.List;

/**
 * Needleman-Wunsch algorithm class is used to compile sequences similarity basing on specified RequestDTO.
 */
public class NeedlemanWunsch {

	private static final int MAX_RESULTS_COUNT = 100;	// Maximum returned results count

	int resultsCount = 0;		// Returned results count

	private String sequence1;	// First sequence to compare
	private String sequence2;	// Second sequence to compare

	private FMatrixElement[][] fMatrix;		// So called "F matrix" used to find best similarity match
	private double[][] similarityMatrix;	// Similarity matrix pointing out penalties for nucleotyde mismatch
	private double gapPenalty;				// Penalty for gap in one of the sequences

	private ResultDTO result = null;		// Object containing results

	
	/**
	 * Needleman-Wunsch constructor.
	 * 
	 * @param request - contains initialization request data
	 */
	public NeedlemanWunsch(RequestDTO request) {
		this.sequence1 = request.getSequence1();
		this.sequence2 = request.getSequence2();
		this.similarityMatrix = request.getSimilarityMatrix2D();
		this.gapPenalty = request.getGapPenalty();
	}

	/**
	 * Used to perform algorithm and prepare results set.
	 */
	public void run() {
		this.compileFMatrix();
		this.prepareResults();
//		this.printResults();		//DEBUG mode only
	}

	/**
	 * Compiles F matrix.
	 */
	private void compileFMatrix() {
		this.fMatrix = new FMatrixElement[this.sequence1.length() + 1][this.sequence2.length() + 1];

		//Matrix initialization
		for (int y = 0; y <= this.sequence1.length(); y++) {
			this.fMatrix[y][0] = new FMatrixElement();
			this.fMatrix[y][0].setValue(this.gapPenalty * y);
		}

		//Matrix initialization
		for (int x = 0; x <= this.sequence2.length(); x++) {
			this.fMatrix[0][x] = new FMatrixElement();
			this.fMatrix[0][x].setValue(this.gapPenalty * x);
		}

		//Matrix computation basing on similarity matrix
		for (int y = 1; y < this.sequence1.length() + 1; y++) {
			for (int x = 1; x < this.sequence2.length() + 1; x++) {
				this.fMatrix[y][x] = new FMatrixElement();
				double k = this.fMatrix[y-1][x-1].getValue() + getSimilarity(this.sequence1.charAt(y - 1), this.sequence2.charAt(x - 1));
				double l = this.fMatrix[y-1][x].getValue() + this.gapPenalty;
				double m = this.fMatrix[y][x-1].getValue() + this.gapPenalty;
				double max = Math.max(k, l);
				max = Math.max(max, m);
				this.fMatrix[y][x].setValue(max);
				// Setting possible routes to retrace possible sequences matching
				if (k == max)
					this.fMatrix[y][x].setDiagonal(true);
				if (l == max)
					this.fMatrix[y][x].setUp(true);
				if (m == max)
					this.fMatrix[y][x].setLeft(true);
			}
		}
	}

	/**
	 * Returns similarity from similarity matrix for two characters.
	 * 
	 * @param first - first character to get similarity
	 * @param second - second character to get similarity
	 * @return double - similarity factor between two given characters
	 */
	private double getSimilarity(char first, char second) {
		return this.similarityMatrix[nucleobasePosition(first)][nucleobasePosition(second)];
	}

	/**
	 * Returns nucleobase index in similarity matrix.
	 * 
	 * @param ch - character representing nucleobase
	 * @return int - nucleobase index in similarity matrix
	 */
	private int nucleobasePosition(char ch) {
		//Each nucleobase character has its place in similarity matrix.
		switch (ch) {
		case 'A':
			return 0;
		case 'C':
			return 1;
		case 'G':
			return 2;
		case 'T':
			return 3;
		}
		return -1;
	}

	/**
	 * Prepares results set from computed F matrix.
	 */
	private void prepareResults() {
		this.result = new ResultDTO();
		this.result.setListOfSequences(this.generateListOfSequences(this.sequence1.length(), this.sequence2.length(),
				null, null));
		this.result.setSimilarityValue(this.fMatrix[this.sequence1.length()][this.sequence2.length()].getValue());
	}

	/**
	 * Generates list of sequences with maximum similarity factor.
	 * 
	 * @param seq1Pos - current position in first sequence
	 * @param seq2Pos - current position in second sequence
	 * @param ch1 - first suffix sequence
	 * @param ch2 - second suffix sequence
	 * @return List<String> - list of sequences with maximum similarity
	 */
	private List<String> generateListOfSequences(int seq1Pos, int seq2Pos, String ch1, String ch2) {
		if (this.resultsCount >= MAX_RESULTS_COUNT)
			return new ArrayList<String>();

		List<String> resultList = new ArrayList<String>();
		StringBuilder chain1 = initializeChain(ch1);
		StringBuilder chain2 = initializeChain(ch2);

		int sequence1Pos = seq1Pos;
		int sequence2Pos = seq2Pos;

		// Going through all possible routes in F matrix
		while (sequence1Pos > 0 && sequence2Pos > 0) {
			// Count variable points out how many recursion calls should by made
			int count = findPossibilitiesCount(sequence1Pos, sequence2Pos);

			int tmpSeq1Pos = sequence1Pos;
			int tmpSeq2Pos = sequence2Pos;

			// If diagonal transition is possible
			if (fMatrix[tmpSeq1Pos][tmpSeq2Pos].isDiagonal()) {
				if (count > 1) {
					// Recursion call
					resultList.addAll(generateListOfSequences(tmpSeq1Pos - 1, tmpSeq2Pos - 1, 
							new StringBuilder(chain1).insert(0, sequence1.charAt(tmpSeq1Pos - 1)).toString(), 
							new StringBuilder(chain2).insert(0, sequence2.charAt(tmpSeq2Pos - 1)).toString()));
					count--;
				} else {
					sequence1Pos--;
					sequence2Pos--;
					chain1.insert(0, sequence1.charAt(sequence1Pos));
					chain2.insert(0, sequence2.charAt(sequence2Pos));
				}
			}

			// If left transition is possible
			if (fMatrix[tmpSeq1Pos][tmpSeq2Pos].isLeft()) {
				if (count > 1) {
					// Recursion call
					resultList.addAll(generateListOfSequences(tmpSeq1Pos, tmpSeq2Pos - 1, 
							new StringBuilder(chain1).insert(0, '-').toString(), 
							new StringBuilder(chain2).insert(0, sequence2.charAt(tmpSeq2Pos - 1)).toString()));
					count--;
				} else {
					sequence2Pos--;
					chain1.insert(0, '-');
					chain2.insert(0, sequence2.charAt(sequence2Pos));
				}
			}

			if (fMatrix[tmpSeq1Pos][tmpSeq2Pos].isUp()) {
				sequence1Pos--;
				chain1.insert(0, sequence1.charAt(sequence1Pos));
				chain2.insert(0, '-');
			}
		}

		// Chains finalization if any of the sequences has not been completed
		finalizeChains(sequence1Pos, sequence2Pos, chain1, chain2);

		// Limiting results count
		if (this.resultsCount < MAX_RESULTS_COUNT) {
			resultList.add(chain1.toString());
			resultList.add(chain2.toString());
			this.resultsCount++;
		}
		return resultList;
	}
	
	/**
	 * Initializes StringBuilder for optimum sequence building.
	 * 
	 * @param ch - base chain sequence
	 * @return StringBuilder for given chain sequence
	 */
	private StringBuilder initializeChain(String ch) {
		if (ch == null)
			return new StringBuilder();
		else
			return new StringBuilder(ch);
	}
	
	/**
	 * Sequences finalization method. Completes unfinished chains.
	 * 
	 * @param sequence1Pos - current position in first sequence
	 * @param sequence2Pos - current position in second sequence
	 * @param chain1 - first sequence chain
	 * @param chain2 - second sequence chain
	 */
	private void finalizeChains(int sequence1Pos, int sequence2Pos, StringBuilder chain1, StringBuilder chain2) {
		while (sequence1Pos > 0) {
			sequence1Pos--;
			chain1.insert(0, sequence1.charAt(sequence1Pos));
			chain2.insert(0, '-');
		}

		while (sequence2Pos > 0) {
			sequence2Pos--;
			chain1.insert(0, '-');
			chain2.insert(0, sequence2.charAt(sequence2Pos));
		}
	}
	
	/**
	 * Finds number of places, which could be base position for transition to given place in F matrix.
	 * 
	 * @param sequence1Pos - given position in first sequence
	 * @param sequence2Pos - given position in second matrix
	 * @return
	 */
	private int findPossibilitiesCount(int sequence1Pos, int sequence2Pos) {
		int count = 0;
		if (fMatrix[sequence1Pos][sequence2Pos].isDiagonal())
			count++;
		if (fMatrix[sequence1Pos][sequence2Pos].isLeft())
			count++;
		if (fMatrix[sequence1Pos][sequence2Pos].isUp())
			count++;
		return count;
	}

	/**
	 * @return the sequence1
	 */
	public String getSequence1() {
		return sequence1;
	}

	/**
	 * @param sequence1
	 *            the sequence1 to set
	 */
	public void setSequence1(String sequence1) {
		this.sequence1 = sequence1;
	}

	/**
	 * @return the sequence2
	 */
	public String getSequence2() {
		return sequence2;
	}

	/**
	 * @param sequence2
	 *            the sequence2 to set
	 */
	public void setSequence2(String sequence2) {
		this.sequence2 = sequence2;
	}

	/**
	 * @return the fMatrix
	 */
	public FMatrixElement[][] getFMatrix() {
		return fMatrix;
	}

	/**
	 * @param matrix
	 *            the fMatrix to set
	 */
	public void setFMatrix(FMatrixElement[][] matrix) {
		fMatrix = matrix;
	}

	/**
	 * @return the similarityMatrix
	 */
	public double[][] getSimilarityMatrix() {
		return similarityMatrix;
	}

	/**
	 * @param similarityMatrix
	 *            the similarityMatrix to set
	 */
	public void setSimilarityMatrix(double[][] similarityMatrix) {
		this.similarityMatrix = similarityMatrix;
	}

	/**
	 * @return the gapPenalty
	 */
	public double getGapPenalty() {
		return gapPenalty;
	}

	/**
	 * @param gapPenalty
	 *            the gapPenalty to set
	 */
	public void setGapPenalty(double gapPenalty) {
		this.gapPenalty = gapPenalty;
	}

	/**
	 * @return the result
	 */
	public ResultDTO getResult() {
		return result;
	}

	/**
	 * @param result
	 *            the result to set
	 */
	public void setResult(ResultDTO result) {
		this.result = result;
	}
	
	/**
	 * Method printing to standard output computed results used for debug purposes.
	 */
	private void printResults() {
		for (int j = 0; j <= this.sequence2.length(); j++) {
			for (int i = 0; i <= this.sequence1.length(); i++) {
				System.out.print(this.fMatrix[i][j].getValue() + ", ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println();
		if (this.result != null && this.result.getListOfSequences() != null) {
			boolean flag = true;
			for (String s : this.result.getListOfSequences()) {
				System.out.println(s);
				flag = !flag;
				if (flag)
					System.out.println();
			}
		}
		System.out.println();
	}

}
