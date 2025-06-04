package com.mt.repository;

import com.mt.model.Enquiry;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Simple in-memory repository storing enquiries in a list.
 */
public class EnquiryRepository {
    private final List<Enquiry> enquiries = new ArrayList<>();
    private final AtomicInteger idGenerator = new AtomicInteger(1);

    public void save(Enquiry enquiry) {
        enquiry.setId(idGenerator.getAndIncrement());
        enquiries.add(enquiry);
    }

    public List<Enquiry> findAll() {
        return new ArrayList<>(enquiries);
    }
}
