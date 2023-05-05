import { LightningElement, track } from 'lwc';
import searchYoutubeVideo from '@salesforce/apex/SearchYoutubeVideoController.searchYoutubeVideo';
import detailsOfVideo from '@salesforce/apex/SearchYoutubeVideoController.detailsOfVideo';

export default class SearchYoutubeVideo extends LightningElement {
    @track data;
    @track videoDetail;
    searchVal='';
    isVisible = false;

    searchHandler(event){
        this.searchVal = event.target.value;

    }

    fetchSearchKeyword(){
        searchYoutubeVideo({searchKey:this.searchVal}).then(result=>{
            this.data = JSON.parse(result).items;
        })

    }


    imageHandler(event){
        this.isVisible = true;
        detailsOfVideo({videoId:event.target.name}).then(result=>{
            this.videoDetail = JSON.parse(result).items;
        })
    }

    cancleHandler(){
        this.isVisible = false;

    }
}