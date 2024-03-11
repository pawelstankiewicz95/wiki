package com.pawelapps.wiki.announcement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api")
public class AnnouncementController {
    private final AnnouncementService announcementService;

    @Autowired
    public AnnouncementController(AnnouncementService announcementService) {
        this.announcementService = announcementService;
    }

    @PostMapping("/announcements")
    public ResponseEntity<AnnouncementDto> saveAnnouncement(@RequestBody AnnouncementDto announcementDto){
        AnnouncementDto savedAnnouncementDto = this.announcementService.saveAnnouncement(announcementDto);
        return new ResponseEntity<>(savedAnnouncementDto, HttpStatus.CREATED);
    }

    @GetMapping("/announcements")
    public ResponseEntity<List<AnnouncementDto>> getAnnouncements(){
        List<AnnouncementDto> announcements = announcementService.findAll();
        return new ResponseEntity<>(announcements, HttpStatus.OK);
    }
}
