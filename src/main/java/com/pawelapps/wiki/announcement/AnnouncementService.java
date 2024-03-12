package com.pawelapps.wiki.announcement;

import java.util.List;

public interface AnnouncementService {
    AnnouncementDto saveAnnouncement(AnnouncementDto announcementDto);

    List<AnnouncementDto> findAll();


    AnnouncementDto mapToAnnouncementDto(Announcement announcement);

    Announcement mapToAnnouncement(AnnouncementDto announcementDto);
}
