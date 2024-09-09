package com.tap.dao;

import java.util.List;

import com.tap.model.HelpLine;

public interface HelpLineDAO {

	int insertData(HelpLine h);
	int deleteOnId(int help_id);
	List<HelpLine> fetchAllData();
	HelpLine fetchOnHelpId(int help_id);
}
