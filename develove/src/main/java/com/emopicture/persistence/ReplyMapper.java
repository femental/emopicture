package com.emopicture.persistence;

import java.util.List;

import com.emopicture.domain.Criteria;

public interface ReplyMapper<V,K> extends CRUDMapper<V,K>{

	public List<V> list(K key) throws Exception;
	
	public List<V> listPage(K key,Criteria cri)throws Exception;
	
	public int count(K key)throws Exception;
	
	
}
