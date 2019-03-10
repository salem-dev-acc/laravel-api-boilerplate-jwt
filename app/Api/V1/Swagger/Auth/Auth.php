<?php

/**
 * @SWG\Post(
 *   path="/api/v1/auth/signup",
 *   tags={"auth"},
 *   consumes={"application/x-www-form-urlencoded"},
 *   summary="Sign Up",
 *   @SWG\Response(response=200, description="successful operation"),
 *     @SWG\Parameter(
 *         name="name",
 *         in="formData",
 *         description="Name",
 *         required=true,
 *         type="string"
 *   ),
 *   @SWG\Parameter(
 *         name="email",
 *         in="formData",
 *         description="Email",
 *         required=true,
 *         type="string"
 *   ),
 *   @SWG\Parameter(
 *         name="password",
 *         in="formData",
 *         description="Password",
 *         required=true,
 *         type="string"
 *   ),
 *   @SWG\Parameter(
 *         name="password_confirmation",
 *         in="formData",
 *         description="Password Confirmation",
 *         required=true,
 *         type="string"
 *   ),
 * )
 *
 */
