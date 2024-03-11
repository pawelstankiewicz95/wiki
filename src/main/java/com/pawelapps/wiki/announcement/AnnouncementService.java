package com.pawelapps.wiki.announcement;

import java.util.List;

public interface AnnouncementService {
    AnnouncementResponse saveAnnouncement(Announcement announcement);

    List<AnnouncementResponse> findAll();


    AnnouncementResponse mapToAnnouncementResponse(Announcement announcement);
}
