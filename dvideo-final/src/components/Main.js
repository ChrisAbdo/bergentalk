import React, { Component } from 'react';

class Main extends Component {

  render() {
    return (
      <div 
        className="container-fluid"
        style={{backgroundColor: 'black'}}
        >
          <br></br>
          &nbsp;
          <br></br>
          
          <div className="col-md-2 border border-danger overflow-auto text-center" style={{ maxHeight: '768px', minWidth: '100%' }}>
            <h5><b>Share Video</b></h5>
            <form onSubmit={(event) => {
              event.preventDefault()
              const title = this.videoTitle.value
              this.props.uploadVideo(title)
            }} >
              &nbsp;
              <input type='file' accept=".mp4, .mkv .ogg .wmv" onChange={this.props.captureFile} style={{ width: '250px' }} />
                <div className="form-group mr-sm-2">
                  <input
                    id="videoTitle"
                    type="text"
                    ref={(input) => { this.videoTitle = input }}
                    className="form-control-sm"
                    placeholder="Title..."
                    required />
                </div>
              <button type="submit" className="btn btn-danger btn-block btn-sm">Upload!</button>
              &nbsp;
            </form>
          </div>

          <br/>
          
            { this.props.videos.map((video, key) => {
              return(
                <div className="card-columns">
                <div className="card"
                  style={{ width: '18rem' }}
                >
                    <div className="" style={{ width: '100%', paddingBottom: '1px' }}
                      key={key} >
                      <div className=""
                        style={{backgroundColor: 'grey'}}
                      >
                        <p onClick={() => this.props.changeVideo(video.hash, video.title)}>
                          <video
                            src={`https://ipfs.infura.io/ipfs/${video.hash}`}
                            style={{ width: '100%', height: '10rem', cursor: 'pointer' }}
                            className="card-img-top"
                          />
                        </p>
                        <div className="text-center"
                          style={{backgroundColor: 'grey'}}
                        >
                          <small className="card-title text-black border-top"><b>{video.title}</b></small>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              )
            })}
        <div className="col"
          style={{ minWidth: '100%'}}
        >
              <div className="embed-responsive embed-responsive-16by9 border border-danger overflow-auto text-center" style={{ maxHeight: '768px'}}>
                <video
                  src={`https://ipfs.infura.io/ipfs/${this.props.currentHash}`}
                  controls
                >
                </video>
              </div>
            <h3><b><i>{this.props.currentTitle}</i></b></h3>
          </div>
      </div>
    );
  }
}

export default Main;
