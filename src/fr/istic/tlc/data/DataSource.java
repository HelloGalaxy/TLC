package fr.istic.tlc.data;

import java.util.LinkedList;
import java.util.List;

import fr.istic.tlc.model.Advertisement;

public class DataSource {

	private static List<Advertisement> DATA;

	static {
		DATA = new LinkedList<Advertisement>();
		DATA.add(new Advertisement("PS4", 399.00, "2013-12-08"));
		DATA.add(new Advertisement("Xbox 720", 499.00, "2013-12-08"));
		DATA.add(new Advertisement("Wii", 199.00, "2013-11-13"));
	}

	public synchronized List<Advertisement> getAllAds() {
		return DATA;
	}

	public synchronized List<Advertisement> getAdByTitle(String key) {

		List<Advertisement> ds = new LinkedList<Advertisement>();

		for (Advertisement ad : DATA) {
			if (ad.getTitle().contains(key)) {
				ds.add(ad);
			}
		}

		return ds;
	}

	public synchronized void addAD(Advertisement ad) {
		if (ad != null) {
			DATA.add(ad);
		}
	}

	public synchronized void deleteAds(String key) {
		if (!key.equals("")) {
			for (int i = 0; i< DATA.size(); i++) {
				if (DATA.get(i).getTitle().contains(key)) {
					DATA.remove(i);
					i = 0;
				}
			}
		} else {
			DATA.clear();
		}
	}
}
