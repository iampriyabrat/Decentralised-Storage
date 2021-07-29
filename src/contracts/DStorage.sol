pragma solidity ^0.5.0;

contract DStorage {
  string public name = "DStorage";
  uint public fileCount = 0;
  // Mapping fileId=>Struct 
  mapping(uint => File) public files;

  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDesc;
    uint uploadTime;
    address payable uploader;
  }

  // Event
  event FUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName, 
    string fileDesc,
    uint uploadTime,
    address payable uploader
  );
  constructor() public {
  }

  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDesc) public
  {
    require(bytes(_fileHash).length>0);
    require(bytes(_fileType).length>0);
    require(bytes(_fileDesc).length>0);
    require(bytes(_fileName).length>0);
    require(msg.sender!=address(0));
    require(_fileSize>0);

    fileCount++;
    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDesc, now, msg.sender);

    emit FUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDesc, now, msg.sender;

  }


}