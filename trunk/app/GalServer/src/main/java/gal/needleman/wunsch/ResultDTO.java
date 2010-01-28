/**
 * 
 */
package gal.needleman.wunsch;

import java.util.List;

/**
 * Result set for Needleman-Wunsch algorithm.
 */
public class ResultDTO {

	private List<String> listOfSequences;		// List of resulting sequences
	private double similarityValue;				// Similarity value for sequences matching

	/**
	 * @return the listOfSequences
	 */
	public List<String> getListOfSequences() {
		return listOfSequences;
	}

	/**
	 * @param listOfSequences
	 *            the listOfSequences to set
	 */
	public void setListOfSequences(List<String> listOfSequences) {
		this.listOfSequences = listOfSequences;
	}

	/**
	 * @return the similarityValue
	 */
	public double getSimilarityValue() {
		return similarityValue;
	}

	/**
	 * @param similarityValue
	 *            the similarityValue to set
	 */
	public void setSimilarityValue(double similarityValue) {
		this.similarityValue = similarityValue;
	}

}
