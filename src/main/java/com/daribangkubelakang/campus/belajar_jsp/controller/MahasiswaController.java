package com.daribangkubelakang.campus.belajar_jsp.controller;

import com.daribangkubelakang.campus.belajar_jsp.model.Mahasiswa;
import com.daribangkubelakang.campus.belajar_jsp.repository.MahasiswaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MahasiswaController {
    @Autowired
    private MahasiswaRepository mahasiswaRepository;

    @GetMapping("/form-mhs")
    public String showForm() {
        return "formMhs";
    }

    @GetMapping("/save")
    public String saveMhs(@RequestParam String npm, @RequestParam String name, @RequestParam String major, Model model) {
        Mahasiswa mahasiswa = new Mahasiswa(npm, name, major);

        mahasiswaRepository.save(mahasiswa);

        List<Mahasiswa> mahasiswas = mahasiswaRepository.findAll();

        model.addAttribute("mahasiswas", mahasiswas);

        return "data-mhs";
    }

    @GetMapping("/mahasiswas")
    public  String getAllMhs(Model model) {
        List<Mahasiswa> mahasiswas = mahasiswaRepository.findAll();
        model.addAttribute(mahasiswas);
        return "data-mhs";
    }
}
