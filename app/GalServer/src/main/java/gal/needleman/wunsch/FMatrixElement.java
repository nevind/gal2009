/**
 * 
 */
package gal.needleman.wunsch;

/**
 * FMatrixElement class represents value contained by F matrix extended by attributes pointing
 * possible directions while building result sequences.
 */
public class FMatrixElement {

	double value;		// Original value
	boolean up;			// Whether value could be result of computing from upper record
	boolean left;		// Whether value could be result of computing from left record
	boolean diagonal;	// Whether value could be result of computing from diagonal record

	/**
	 * Default constructor sets all directions to false.
	 */
	public FMatrixElement() {
		this.up = false;
		this.left = false;
		this.diagonal = false;
	}

	/**
	 * @return the value
	 */
	public double getValue() {
		return value;
	}

	/**
	 * @param value
	 *            the value to set
	 */
	public void setValue(double value) {
		this.value = value;
	}

	/**
	 * @return the up
	 */
	public boolean isUp() {
		return up;
	}

	/**
	 * @param up
	 *            the up to set
	 */
	public void setUp(boolean up) {
		this.up = up;
	}

	/**
	 * @return the left
	 */
	public boolean isLeft() {
		return left;
	}

	/**
	 * @param left
	 *            the left to set
	 */
	public void setLeft(boolean left) {
		this.left = left;
	}

	/**
	 * @return the diagonal
	 */
	public boolean isDiagonal() {
		return diagonal;
	}

	/**
	 * @param diagonal
	 *            the diagonal to set
	 */
	public void setDiagonal(boolean diagonal) {
		this.diagonal = diagonal;
	}

}
