package com.pawelapps.wiki.announcement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AnnouncementServiceImpl implements AnnouncementService {

    private final AnnouncementRepository announcementRepository;

    @Autowired
    public AnnouncementServiceImpl(AnnouncementRepository announcementRepository) {
        this.announcementRepository = announcementRepository;
    }

    @Override
    public List<AnnouncementDto> findAll() {
        return announcementRepository.findAll()
                .stream()
                .map(announcement -> mapToAnnouncementDto(announcement))
                .toList();
    }

    @Override
    public AnnouncementDto saveAnnouncement(AnnouncementDto announcementDto) {
        Announcement savedAnnouncement = this.announcementRepository.save(this.mapToAnnouncement(announcementDto));
        return this.mapToAnnouncementDto(savedAnnouncement);
    }

    @Override
    public AnnouncementDto mapToAnnouncementDto(Announcement announcement) {
        AnnouncementDto announcementDto = AnnouncementDto.builder()
                .id(announcement.getId())
                .title(announcement.getTitle())
                .description(announcement.getDescription())
                .build();
        return announcementDto;
    }

    @Override
    public Announcement mapToAnnouncement(AnnouncementDto announcementDto) {
        Announcement announcement = Announcement.builder()
                .id(announcementDto.id())
                .title(announcementDto.title())
                .description(announcementDto.description())
                .build();
        return announcement;
    }
}
