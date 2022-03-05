package entity;


public class Customer {

	private String FIRSTNAME;
	private String LASTNAME;
	private String USERNAME;
	private String EMAILID;
	private Long MOBILENUMBER;
	private String ADDRESS;
	private String PASSWORD;
	private String GENDER;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(String fIRSTNAME, String lASTNAME, String uSERNAME, String eMAILID, Long mOBILENUMBER,
			String aDDRESS, String pASSWORD, String gENDER) {
		super();
		FIRSTNAME = fIRSTNAME;
		LASTNAME = lASTNAME;
		USERNAME = uSERNAME;
		EMAILID = eMAILID;
		MOBILENUMBER = mOBILENUMBER;
		ADDRESS = aDDRESS;
		PASSWORD = pASSWORD;
		GENDER = gENDER;
	}

	public String getFIRSTNAME() {
		return FIRSTNAME;
	}

	public void setFIRSTNAME(String fIRSTNAME) {
		FIRSTNAME = fIRSTNAME;
	}

	public String getLASTNAME() {
		return LASTNAME;
	}

	public void setLASTNAME(String lASTNAME) {
		LASTNAME = lASTNAME;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getEMAILID() {
		return EMAILID;
	}

	public void setEMAILID(String eMAILID) {
		EMAILID = eMAILID;
	}

	public Long getMOBILENUMBER() {
		return MOBILENUMBER;
	}

	public void setMOBILENUMBER(Long mOBILENUMBER) {
		MOBILENUMBER = mOBILENUMBER;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getGENDER() {
		return GENDER;
	}

	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}

}