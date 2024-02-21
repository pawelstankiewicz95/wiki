package com.pawelapps.wiki.solution.image;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ImageServiceImpl implements ImageService {

    private static final String IMAGE_DIRECTORY = "C:/Users/pawel/IdeaProjects/wiki-frontend/wiki-frontend/src/assets/images/";

    @Override
    public List<String> convertBase64ImagesToUrls(List<String> base64Images) {
        List<String> imageUrls = new ArrayList<>();

        for (String base64Image : base64Images) {
            String imageUrl = saveBase64ImageAsFileAndGetUrl(base64Image);
            imageUrls.add(imageUrl);
        }

        return imageUrls;
    }

    @Override
    public String saveBase64ImageAsFileAndGetUrl(String base64Image) {
        String imageType = extractImageTypeFromBase64(base64Image);
        byte[] imageBytes = decodeBase64Image(base64Image);
        String fileName = generateUniqueFileName(imageType);
        writeImageBytesToFile(imageBytes, fileName);
        return constructImageUrl(fileName);
    }

    @Override
    public List<String> findBase64ImagesInHtml(String htmlWithBase64) {
        List<String> base64Images = new ArrayList<>();
        Pattern pattern = Pattern.compile("data:image/(.*?);base64,([^\"']+)");
        Matcher matcher = pattern.matcher(htmlWithBase64);
        while (matcher.find()) {
            base64Images.add(matcher.group(0));
        }
        return base64Images;
    }

    @Override
    public String replaceBase64ImagesWithUrlsInHtml(String htmlWithBase64, List<String> imageUrls) {
        for (String imageUrl : imageUrls) {
            htmlWithBase64 = replaceFirstBase64ImageWithUrlInHtml(htmlWithBase64, imageUrl);
        }
        return htmlWithBase64;
    }

    private String extractImageTypeFromBase64(String base64Image) {
        String[] parts = base64Image.split(",");
        return parts[0].split("/")[1].split(";")[0];
    }

    private byte[] decodeBase64Image(String base64Image) {
        String[] parts = base64Image.split(",");
        return Base64.getDecoder().decode(parts[1]);
    }

    private String generateUniqueFileName(String imageType) {
        return UUID.randomUUID().toString() + "." + imageType;
    }

    private void writeImageBytesToFile(byte[] imageBytes, String fileName) {
        try (FileOutputStream fos = new FileOutputStream(IMAGE_DIRECTORY + fileName)) {
            FileCopyUtils.copy(imageBytes, fos);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String constructImageUrl(String fileName) {
        return IMAGE_DIRECTORY + fileName;
    }

    private String replaceFirstBase64ImageWithUrlInHtml(String htmlWithBase64, String imageUrl) {
        return htmlWithBase64.replaceFirst("data:image/(.*?);base64,[^\"']+", imageUrl);
    }
}
