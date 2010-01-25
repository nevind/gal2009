/**
 * 
 */
package pl.edu.pw.elka.mbi;

import java.util.List;

/**
 *
 */
public class NeedlemanWunsch {
	
	private String sequence1;
	private String sequence2;
	
	private double[][] fMatrix;
	private double[][] similarityMatrix;
	private double gapPenalty;
	
	private ResultDTO result = null;
	
	NeedlemanWunsch(RequestDTO request) {
		this.sequence1 = request.getSequence1();
		this.sequence2 = request.getSequence2();
		this.similarityMatrix = request.getSimilarityMatrix();
		this.gapPenalty = request.getGapPenalty();
	}
	
	public void run() {
		this.compileFMatrix();
		this.prepareResults();
		this.printResults();
	}
	
	private void compileFMatrix() {
		this.fMatrix = new double[this.sequence1.length()+1][this.sequence2.length()+1];
		
		for (int y = 0; y <= this.sequence1.length(); y++) {  //inicjalizacja macierzy
			this.fMatrix[y][0] = this.gapPenalty * y;
		}
		
		for (int x = 0; x <= this.sequence2.length(); x++) { //inicjalizacja macierzy
			this.fMatrix[0][x] = this.gapPenalty * x;
		}
		
		for (int y = 1; y < this.sequence1.length() + 1; y++) {  //wyliczenie macierzy korzystajc z macierzy podobienstwa
			for (int x = 1; x < this.sequence2.length() +1; x++) {                    
				double k = this.fMatrix[y-1][x-1] + getSimilarity(this.sequence1.charAt(y-1), this.sequence2.charAt(x-1));
				double l = this.fMatrix[y-1][x] + this.gapPenalty;
				double m = this.fMatrix[y][x-1] + this.gapPenalty;
				k = Math.max(k,l);
				this.fMatrix[y][x] = Math.max(k,m);
			}
		}
	}
	
	private double getSimilarity(char first, char second) {
		return this.similarityMatrix[nucleobasePosition(first)][nucleobasePosition(second)];
	}
	
	private int nucleobasePosition(char ch) {
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
	
	private void prepareResults() {
		this.result = new ResultDTO();
		this.result.setListOfSequences(this.generateListOfSequences());
		this.result.setSimilarityValue(this.fMatrix[this.sequence1.length()][this.sequence2.length()]);
	}
	
	private List<String> generateListOfSequences() {
		
		return null;
	}
	
	/**
	 * @return the sequence1
	 */
	public String getSequence1() {
		return sequence1;
	}

	/**
	 * @param sequence1 the sequence1 to set
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
	 * @param sequence2 the sequence2 to set
	 */
	public void setSequence2(String sequence2) {
		this.sequence2 = sequence2;
	}

	/**
	 * @return the fMatrix
	 */
	public double[][] getFMatrix() {
		return fMatrix;
	}
	
	/**
	 * @param matrix the fMatrix to set
	 */
	public void setFMatrix(double[][] matrix) {
		fMatrix = matrix;
	}
	
	/**
	 * @return the similarityMatrix
	 */
	public double[][] getSimilarityMatrix() {
		return similarityMatrix;
	}
	
	/**
	 * @param similarityMatrix the similarityMatrix to set
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
	 * @param gapPenalty the gapPenalty to set
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
	 * @param result the result to set
	 */
	public void setResult(ResultDTO result) {
		this.result = result;
	}
	
	private void printResults() {
		for(int j = 0; j<=this.sequence2.length(); j++) {
			for(int i = 0; i<=this.sequence1.length();i++) {
				System.out.print(this.fMatrix[i][j]+", ");
			}
			System.out.println();
		}
	}
	
}
