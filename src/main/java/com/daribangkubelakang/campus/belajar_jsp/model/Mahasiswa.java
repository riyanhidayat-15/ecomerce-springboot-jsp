package com.daribangkubelakang.campus.belajar_jsp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "mahasiswa")
public class Mahasiswa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String npm;
    private String name;
    private String major;

    public Mahasiswa() {

    }

    public Mahasiswa(String npm, String name, String major) {
        this.name = name;
        this.npm = npm;
        this.major = major;
    }

    public Long getId () {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNpm() {
        return npm;
    }

    public void setNpm(String npm) {
        this.npm = npm;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
}
