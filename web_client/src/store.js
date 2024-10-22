import { data, get } from 'jquery';
import { createStore } from 'vuex'



const store = createStore({
    state: {
        token: null,
        id: null,
        user: []
    },
    mutations: {
        setToken(state, token) {
            state.token = token
            localStorage.setItem('token', token);
        },
        clearToken(state) {
            state.token = '';
            localStorage.removeItem('token'); // Remove token from localStorage
        },
        setUser(state, user) {
            state.user = user
        },
        setId(state, id) {
            state.id = id
            localStorage.setItem('id', id);
            /*************  ✨ Codeium Command ⭐  *************/
            /**
    /******  f73c3a6b-7882-4cf0-8605-473b3697a667  *******/
        }, clearId(state) {
            state.token = '';
            localStorage.removeItem('id'); // Remove token from localStorage
        },
    },
    actions: {
        setId({ commit }, id) {
            commit('setId', id);
        },
        clearId({ commit }) {
            commit('clearId');
        },
        setToken({ commit }, token) {
            commit('setToken', token);
        },
        clearToken({ commit }) {
            commit('clearToken');
        }
    },
    getters: {
        getToken: state => state.token,
        isLoggedIn: state => !!state.token,
        getId: state => state.id,
        getId: state => state.id
    }
})

export default store