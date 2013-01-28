class ScsiCmd {
private:
	ScsiCmd();
	int fd;
	struct sg_io_hdr *p_hdr;
	UINT8 sense_buffer[SENSE_LEN];
	//UINT8 data_buffer[BLOCK_LEN];
	UINT8 *data_buffer;
protected:
	ScsiCmd(const int fd);
public:

	virtual ~ScsiCmd();
	virtual int execute();

	void setTimeOut(const int timeout);

	//fills all parameters of 'struct sg_io_hdr'
	unsigned char getSgIoStatus();
	unsigned int getSgIoInfo();
	int getSgIoResid();
	unsigned short getSgIoDriverStatus();
	unsigned short getSgIoHostStatus();
	unsigned char getSgIoSbLenWr();
	unsigned char getSgIoMsgStatus();
	unsigned char getSgIoMaskedStatus();
	unsigned char *getSgIoCmdp();
	void *getSgIoUsrPtr();
	int getSgIoPackId();
	unsigned char *getSgIoSbp();

	void *getSgIoDxferp();

	void setSgIoInterfaceId(int id);
	void setSgIoDxferDirection(int direction);
	void setSgIoCmdLen(UINT8 cmdLen);
	void setSgIoMxSbLen(unsigned char sbLen);
	void setSgIoIovecCount(unsigned short iovecCount);
	void setSgIoDxferLen(unsigned int dxferLen);
	void setSgIoDxferp(void * dxferp);
	void setSgIoCmdp(unsigned char* cmdp);
	void setSgIoSbp(unsigned char* sbp);
	void setSgIoTimeoutMiliSeconds(int timeout);
	void setSgIoFlags(unsigned int flags);
	void setSgIoPackId(int packId);
	void setSgIoUsrPtr(void *usrPtr);

	struct sg_io_hdr *getSgIoStructHdr();

};
#endif /* ATACMD_H_ */