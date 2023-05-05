public with sharing class SearchYoutubeVideoController {
    private static final String API_KEY = 'AIzaSyCMBgScKbRZTNXaYb6z5inzTFDzKe3jTnQ';
    @AuraEnabled
    public static string searchYoutubeVideo(string searchKey) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=20&q='+searchKey+'&type=video&key='+API_KEY;
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response.getBody();
    }

    @AuraEnabled
    public static string detailsOfVideo(String videoId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://www.googleapis.com/youtube/v3/videos?part=statistics&id='+videoId+'&key='+API_KEY;
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response.getBody();
    }
}