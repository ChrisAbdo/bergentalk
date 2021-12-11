pragma solidity ^0.5.0;

contract DVideo {
    uint256 public videoCount = 0;
    string public name = "DVideo";
    mapping(uint256 => Video) public videos;

    struct Video {
        uint256 id;
        string hash;
        string title;
        uint256 tipAmount;
        address payable author;
    }

    event VideoUploaded(
        uint256 id,
        string hash,
        string title,
        uint256 tipAmount,
        address payable author
    );

    event VideoTipped(
        uint256 id,
        string hash,
        string title,
        uint256 tipAmount,
        address payable author
    );

    constructor() public {}

    function uploadVideo(string memory _videoHash, string memory _title)
        public
    {
        // Make sure the video hash exists
        require(bytes(_videoHash).length > 0);
        // Make sure video title exists
        require(bytes(_title).length > 0);
        // Make sure uploader address exists
        require(msg.sender != address(0));

        // Increment video id
        videoCount++;

        // Add video to the contract
        videos[videoCount] = Video(
            videoCount,
            _videoHash,
            _title,
            0,
            msg.sender
        );
        // Trigger an event
        emit VideoUploaded(videoCount, _videoHash, _title, 0, msg.sender);
    }

    function tipVideoOwner(uint256 _id) public payable {
        // Make sure the id is valid
        require(_id > 0 && _id <= videoCount);
        //fetch the video.
        Video memory video = videos[_id];
        //fetch the author.
        address payable author = video.author;
        //pay the author by sending them Ether
        address(author).transfer(msg.value);
        //increment the tip amount
        video.tipAmount += msg.value;
        //update the video
        videos[_id] = video;
        //trigger an event
        emit VideoTipped(
            _id,
            video.hash,
            video.title,
            video.tipAmount,
            video.author
        );
    }
}
