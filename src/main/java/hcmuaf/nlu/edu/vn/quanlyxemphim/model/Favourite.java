package hcmuaf.nlu.edu.vn.quanlyxemphim.model;

public class Favourite {
    private int id;
    private String title;
    private String posterUrl;
    private int duration;

    public Favourite(int id, String title, String posterUrl, int duration) {
        this.id = id;
        this.title = title;
        this.posterUrl = posterUrl;
        this.duration = duration;
    }

    public Favourite() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
}
