package com.cvc.util;

import static com.cvc.util.AllMessageShow.MESSAGE_ATTRIBUTE;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public final class MessageHelper {

    private MessageHelper() {

    }

    public static void addSuccessAttribute(RedirectAttributes ra, String message, Object... args) {
        addAttribute(ra, message, AllMessageShow.Type.SUCCESS, args);
    }

    public static void addErrorAttribute(RedirectAttributes ra, String message, Object... args) {
        addAttribute(ra, message, AllMessageShow.Type.DANGER, args);
    }

    public static void addInfoAttribute(RedirectAttributes ra, String message, Object... args) {
        addAttribute(ra, message, AllMessageShow.Type.INFO, args);
    }

    public static void addWarningAttribute(RedirectAttributes ra, String message, Object... args) {
        addAttribute(ra, message, AllMessageShow.Type.WARNING, args);
    }

    private static void addAttribute(RedirectAttributes ra, String message, AllMessageShow.Type type, Object... args) {
        ra.addFlashAttribute(MESSAGE_ATTRIBUTE, new AllMessageShow(message, type, args));
    }

    public static void addSuccessAttribute(Model model, String message, Object... args) {
        addAttribute(model, message, AllMessageShow.Type.SUCCESS, args);
    }

    public static void addErrorAttribute(Model model, String message, Object... args) {
        addAttribute(model, message, AllMessageShow.Type.DANGER, args);
    }

    public static void addInfoAttribute(Model model, String message, Object... args) {
        addAttribute(model, message, AllMessageShow.Type.INFO, args);
    }

    public static void addWarningAttribute(Model model, String message, Object... args) {
        addAttribute(model, message, AllMessageShow.Type.WARNING, args);
    }

    private static void addAttribute(Model model, String message, AllMessageShow.Type type, Object... args) {
        model.addAttribute(MESSAGE_ATTRIBUTE, new AllMessageShow(message, type, args));
    }
}
