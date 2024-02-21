package com.pawelapps.wiki.solution.image;

import java.util.List;

public interface ImageService {
    List<String> convertBase64ImagesToUrls(List<String> base64Images);

    String saveBase64ImageAsFileAndGetUrl(String base64Image);

    List<String> findBase64ImagesInHtml(String htmlWithBase64);

    String replaceBase64ImagesWithUrlsInHtml(String htmlWithBase64, List<String> imageUrls);
}
