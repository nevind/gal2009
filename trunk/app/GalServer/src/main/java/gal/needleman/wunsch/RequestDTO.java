/**
 * 
 */
package gal.needleman.wunsch;

/**
 * RequestDTO object contains information about input sequences, similarity matrix and gap penalty for missed match.
 */
public class RequestDTO {

	private String sequence1;			// First input sequence
	private String sequence2;			// Second input sequence
	private double[] similarityMatrix;	// Similarity matrix for sequence's alphabet
	private double gapPenalty;			// Gap penalty for sequence inconsistency.

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
	 * @return the similarityMatrix
	 */
	public double[] getSimilarityMatrix() {
		return similarityMatrix;
	}

	/**
	 * Returns the similarity matrix in 2-dimensional format for serialization purposes.
	 * 
	 * @return the similarityMatrix
	 */
	public double[][] getSimilarityMatrix2D() {
		double[][] result = new double[4][4];
		for (int i = 0; i < 4; i++)
			for (int j = 0; j < 4; j++) {
				result[i][j] = similarityMatrix[i*4+j];
			}
		return result;
	}

	/**
	 * @param similarityMatrix
	 *            the similarityMatrix to set
	 */
	public void setSimilarityMatrix(double[] similarityMatrix) {
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

}
