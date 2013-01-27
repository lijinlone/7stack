package me.sevenstack.web.service;

import java.io.Serializable;
import java.util.List;

import com.google.inject.ImplementedBy;

import me.sevenstack.web.model.Post;
import me.sevenstack.web.service.impl.PostServiceImpl;
@ImplementedBy(PostServiceImpl.class)
public interface PostService extends Serializable {

	public Post findPost(Post post) throws Exception;

	public Post findPostById(Integer postId) throws Exception;

	public List<Post> findPostList(Post post) throws Exception;

	public Integer savePost(Post post) throws Exception;

	public void updatePost(Post post) throws Exception;

	public Integer saveOrUpdatePost(Post post) throws Exception;

	public void deletePost(Post post) throws Exception;

	public void deletePostById(Integer postId) throws Exception;

}