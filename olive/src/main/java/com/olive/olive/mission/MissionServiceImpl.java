package com.olive.olive.mission;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.olive.common.dao.CommonDAO;

@Service("mission.missionService")
public class MissionServiceImpl implements MissionService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertMission(Mission dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMission(Mission dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMission(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMissionImage(Mission dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMissionImage(int imageNum, String pathname) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Mission> listMission() {
		List<Mission> list = null;
		try {
			list=dao.selectList("mission.listMission");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mission> listCurrentNotMyMission(String userId) {
		List<Mission> list = null;
		try {
			list=dao.selectList("mission.listCurrentNotMyMission", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countCurrentNotMyMission(String userId) {
		int result = 0;
		try {
			result=dao.selectOne("mission.countCurrentNotMyMission", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countLike(int num) {
		int result = 0;
		try {
			result=dao.selectOne("mission.countLike", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertMissionAttend(Mission dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMissionAttend(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int countAttend(int missionNum) {
		int result = 0;
		try {
			result=dao.selectOne("mission.countAttend", missionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Mission> listMyAttend(String userId) {
		List<Mission> list = null;
		try {
			list=dao.selectList("mission.listMyAttend", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countMyCompleteAttend(String userId) {
		int result = 0;
		try {
			result=dao.selectOne("mission.countMyCompleteAttend", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Mission> listMyCurrentAttend(String userId) {
		List<Mission> list = null;
		try {
			list=dao.selectList("mission.listMyCurrentAttend", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countMyCurrentAttend(String userId) {
		int result = 0;
		try {
			result=dao.selectOne("mission.countMyCurrentAttend", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertMissionContent(Content dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMissionContent(Content dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMissionContent(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Content> listMissionContent(int missionNum) {
		List<Content> list = null;
		try {
			list=dao.selectList("mission.listMissionContent", missionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertMissionContentAttend(Content dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMissionContentAttend(Content dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMissionContentAttend(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countContentAttend(int contentNum) {
		int result = 0;
		try {
			result=dao.selectOne("mission.countContentAttend", contentNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Content getMyContentAttend(Map<String, Object> map) {
		Content dto = null;
		try {
			dto=dao.selectOne("mission.getMyContentAttend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int checkMyContentAttendAccept(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}