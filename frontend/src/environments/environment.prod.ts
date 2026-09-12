export const environment = {
  production: true,
  // En production, Nginx sert le frontend et l'API sous le même domaine :
  // un chemin relatif évite toute configuration CORS.
  apiUrl: '/api/v1',
  privacyPolicyVersion: '2026-09-01'
};
