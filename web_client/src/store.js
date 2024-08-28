import { data } from 'jquery';
import { createStore } from 'vuex'



const store = createStore({
    state: {
        token: null,
        user : []
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
        setUser(state, user){
            state.user = user
        }
    },
    actions: {
        setToken({ commit }, token) {
            commit('setToken', token);
        },
        clearToken({ commit }) {
            commit('clearToken');
        }
    },
    getters: {
        getToken: state => state.token,
        isLoggedIn: state => !!state.token
    }
})

export default store