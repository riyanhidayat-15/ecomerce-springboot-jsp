package com.daribangkubelakang.campus.belajar_jsp.repository;

import com.daribangkubelakang.campus.belajar_jsp.model.Mahasiswa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MahasiswaRepository extends JpaRepository<Mahasiswa, Long> {
}
