package com.pawelapps.wiki.announcement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AnnouncementServiceImpl implements AnnouncementService{

    private final AnnouncementRepository announcementRepository;

    @Autowired
    public AnnouncementServiceImpl(AnnouncementRepository announcementRepository) {
        this.announcementRepository = announcementRepository;
    }

    @Override
    public List<AnnouncementResponse> findAll() {
        return announcementRepository.findAll()
                .stream()
                .map(solution -> mapToAnnouncementResponse(solution))
                .toList();
    }

    @Override
    public AnnouncementResponse saveAnnouncement(Announcement announcement){
       Announcement savedAnnouncement =  this.announcementRepository.save(announcement);
       return mapToAnnouncementResponse(savedAnnouncement);
    }

    @Override
    public AnnouncementResponse mapToAnnouncementResponse(Announcement announcement) {
        AnnouncementResponse announcementResponse = AnnouncementResponse.builder()
                .id(announcement.getId())
                .title(announcement.getTitle())
                .description(announcement.getDescription())
                .build();
        return announcementResponse;
    }
}
